Pod::Spec.new do |s|

  s.name = "Pulse"
  s.version = "1.0.0"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.summary = "An easy animated Pulse layer and view"
  s.homepage = "https://github.com/omiz/Pulse"
  s.author = { "Omar Allaham" => "o.allaham@icloud.com" }
  s.source = { :git => 'https://github.com/omiz/Pulse.git', :tag => s.version.to_s }

  s.ios.deployment_target = "8.0"

  s.requires_arc = 'true'
  s.source_files = 'Pulse/*.swift'

end