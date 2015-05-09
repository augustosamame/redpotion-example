# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require "motion/project/template/ios"

require "bundler"
Bundler.require

# require "bubble-wrap"

Motion::Project::App.setup do |app|
  app.name = "RubyMotion Community"
  app.identifier = "com.willrax.community"

  app.short_version = "0.1.0"
  app.version = app.short_version

  app.icons = Dir.glob("resources/icon*.png").map{|icon| icon.split("/").last}

  app.device_family = [:iphone, :ipad]
  app.interface_orientations = [:portrait, :landscape_left, :landscape_right, :portrait_upside_down]

  app.files += Dir.glob(File.join(app.project_dir, "lib/**/*.rb"))

  app.pods do
    pod "JMImageCache"
  end

  app.development do
    app.codesign_certificate = "iPhone Developer: YOURNAME"
    app.provisioning_profile = "signing/example.mobileprovision"
  end

  app.release do
    app.entitlements["get-task-allow"] = false
    app.codesign_certificate = "iPhone Distribution: YOURNAME"
    app.provisioning_profile = "signing/example.mobileprovision"
    app.seed_id = "YOUR_SEED_ID"
    app.entitlements["application-identifier"] = app.seed_id + "." + app.identifier
    app.entitlements["keychain-access-groups"] = [ app.seed_id + "." + app.identifier ]
  end

  puts "Name: #{app.name}"
  puts "Using profile: #{app.provisioning_profile}"
  puts "Using certificate: #{app.codesign_certificate}"
end
