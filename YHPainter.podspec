#
# Be sure to run `pod lib lint YHPainter.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YHPainter'
  s.version          = '0.1.1'
  s.summary          = 'iOS 绘制图片'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  iOS 绘制图片 创建上下文 导出PNG JPEG
                    DESC

  s.homepage         = 'https://github.com/yinhaofrancis/YHPainter'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yinhaofrancis' => '1833918721@qq.com' }
  s.source           = { :git => 'https://github.com/yinhaofrancis/YHPainter.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'YHPainter/Classes/**/*'
  
  # s.resource_bundles = {
  #   'YHPainter' => ['YHPainter/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'

  s.frameworks = 'MobileCoreServices', 'ImageIO' ,'QuartzCore'
  # s.dependency 'AFNetworking', '~> 2.3'
end
