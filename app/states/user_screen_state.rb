class UserScreenState
  include ViewHelpers

  attr_accessor :avatar, :name, :last_seen_at

  def attr(attribute)
    self.send(attribute) || defaults[attribute]
  end

  def defaults
    {
      name: "Loading...",
      last_seen_at: "Loading...",
      avatar: rmq.image.resource("default-avatar")
    }
  end
end
