class UserScreen < PM::Screen
  include ViewHelpers

  attr_accessor :topic

  stylesheet UserScreenStylesheet

  def title
    "😀 #{topic.last_poster}"
  end

  def on_load
    render(UserScreenState.new)
    fetch_user
  end

  def render(state)
    build_initial_ui unless @ui_built

    find(:name).data(state.get(:name))
    find(:avatar_image).data(state.get(:avatar))
    find(:last_seen_at).data(state.get(:last_seen_at))
    find(:details_title).data(state.get(:details_title))
  end

  def build_initial_ui
    append(UIImageView, :avatar_image)
    append(UILabel, :name)
    append(UILabel, :details_title)
    append(UILabel, :last_seen_at)

    @ui_built = true
  end

  def fetch_user
    fetcher = DiscourseFetcher.new("users/#{topic.last_poster}.json")

    fetcher.fetch do |response|
      user = User.new(response[:user])

      state = UserScreenState.new
      state.name = user.name
      state.avatar = user.avatar
      state.last_seen_at = "Last Seen on #{datetime_long(user.last_seen_at)}"
      state.details_title = "User Information"

      render(state)
    end
  end
end
