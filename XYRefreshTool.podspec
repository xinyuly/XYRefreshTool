Pod::Spec.new do |s|

  s.name         = "XYRefreshTool"
  s.version      = "1.0.2"
  s.summary      = "刷新控件，下拉刷新，上拉加载更多."

  s.homepage     = "https://github.com/xinyuly/XYRefreshTool"
  s.license      = "MIT"
  s.author       = {"lixinyu" => 'li_xinyuly@163.com'}

  s.platform     = :ios, "8.0"

  s.source       = { :git => 'https://github.com/xinyuly/XYRefreshTool.git', :tag => s.version }

  s.source_files  = "Source/*.{h,m}"
  s.resources    = 'Source/XYRefreshTool.bundle'

  s.requires_arc = true



end
