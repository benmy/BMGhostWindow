Pod::Spec.new do |s|
  s.name             = 'BMGhostWindow'
  s.version          = '0.1.0'
  s.summary          = '仿微信的浮窗功能实现.'
  s.description      = <<-DESC
仿微信的浮窗功能实现，包含动画等。
                       DESC

  s.homepage         = 'https://github.com/benmy/BMGhostWindow'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Benmy' => '389931983@qq.com' }
  s.source           = { :git => 'https://github.com/benmy/BMGhostWindow.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'BMGhostWindow/Classes/**/*'
  
  # s.resource_bundles = {
  #   'BMGhostWindow' => ['BMGhostWindow/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
end
