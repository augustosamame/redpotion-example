class TopicsScreen < PM::TableScreen
  attr_reader :topics

  title ""
  stylesheet TopicsScreenStylesheet

  def on_load
    @topics = []
    fetcher = DiscourseFetcher.new("latest.json")

    fetcher.fetch do |topics_json|
      @topics = Topic.build_many(topics_json)
      update_table_data
    end
  end

  def table_data
    [{
      title: "",
      cells: topics.map do |topic|
        {
          title: topic.title,
          subtitle: "last poster: #{topic.last_poster}",
          action: :open_profile,
          arguments: { topic: topic }
        }
      end
    }]
  end

  def open_profile(data)
    open UserScreen.new(topic: data[:topic])
  end

  def will_animate_rotate(orientation, duration)
    find.all.reapply_styles
  end
end
