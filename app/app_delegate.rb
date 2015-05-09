class AppDelegate < PM::Delegate
  status_bar true, animation: :fade

  def on_load(app, options)
    open TopicsScreen.new(nav_bar: true)
  end

  def application(application, willChangeStatusBarOrientation: new_orientation, duration: duration)
    device.orientation = new_orientation
  end
end
