Pod::Spec.new do |s|
  s.name         = "NCacheManager.podspec"
  s.version      = "0.1"
  s.summary      = "Cache Manager for ios save cacne data to share storage."
  s.homepage     = "https://github.com/destwofe/NCacheManager.podspec"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Napat Yimjan" => "destwofe@hotmail.com" }
  s.source       = { 
    :git => "https://github.com/destwofe/NCacheManager.git", 
    :tag => "0.1"
  }

  s.platform     = :ios, '8.3'
  s.source_files = '*.{h,m}'
  s.requires_arc = true
end