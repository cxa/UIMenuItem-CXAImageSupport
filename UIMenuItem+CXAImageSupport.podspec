Pod::Spec.new do |s|
  s.name         = "UIMenuItem+CXAImageSupport"
  s.version      = "0.0.1"
  s.summary      = "UIMenuItem with Image Support."
  s.homepage     = "https://github.com/cxa/UIMenuItem-CXAImageSupport"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "CHEN Xian'an" => "xianan.chen@gmail.com" }
  s.source       = { :git => "https://github.com/cxa/UIMenuItem-CXAImageSupport.git", :tag => "0.0.1" }
  s.source_files = '*.{h,m}'
  s.platform     = :ios, '5.0'
  s.requires_arc = true
  s.frameworks = 'UIKit'
end
