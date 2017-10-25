Pod::Spec.new do |s|
  s.platform              = :ios
  s.ios.deployment_target = '9.0'
  s.name          = "SwiftDispatchOnce"
  s.version       = "2.0.0"
  s.summary       = "SwiftDispatchOnce adds an extension on DispatchQueue for performing a closure only once"
  s.homepage      = "https://github.com/JRG-Developer/SwiftDispatchOnce"
  s.license       = { :type => "MIT", :file => "LICENSE" }
  s.author        = { "Joshua Greene" => "jrg.developer@gmail.com" }
  s.source        = { :git => "https://github.com/JRG-Developer/SwiftDispatchOnce.git",
                      :tag => "#{s.version}" }
  s.requires_arc = true
  s.framework = "Foundation"
  s.source_files = "SwiftDispatchOnce/Library/*.{swift}"
end
