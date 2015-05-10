class UserScreenState
  attr_accessor :avatar, :name, :last_seen_at, :details_title

  def get(attribute)
    self.send(attribute) || defaults[attribute]
  end

  def defaults
    {
      last_seen_at: "",
      details_title: "",
      name: "Loading...",
      avatar: rmq.image.resource("default-avatar")
    }
  end
end
