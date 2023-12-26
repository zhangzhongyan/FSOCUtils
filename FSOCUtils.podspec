#
# Be sure to run `pod lib lint FSOCUtils.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FSOCUtils'
  s.version          = '1.0.6'
  s.summary          = 'Object-c 工具基础组件'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  用于多APP共用，并通过子仓库的形式进行可选择性的集成组件
                       DESC

  s.homepage         = 'https://github.com/zhangzhongyan/FSOCUtils'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhangzhongyan' => '749994100@qq.com' }
  s.source           = { :git => 'https://github.com/zhangzhongyan/FSOCUtils.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  
  # s.resource_bundles = {
  #   'FSOCUtils' => ['FSOCUtils/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
  s.requires_arc = true
  s.default_subspec = 'SafeUtils'
  
  # CountDownUtils仓库
  s.subspec 'CountDownUtils' do |ss|
    ss.source_files = 'FSOCUtils/Classes/CountDownUtils/*{h,m}'
    #ss.dependency 'ReactiveObjC', '~> 3.1.1'
  end
  
  # EncyptUtils仓库
  s.subspec 'EncyptUtils' do |ss|
    ss.source_files = 'FSOCUtils/Classes/EncyptUtils/*{h,m}'
  end
  
  # JSONUtils仓库
  s.subspec 'JSONUtils' do |ss|
    ss.source_files = 'FSOCUtils/Classes/JSONUtils/*{h,m}'
    ss.dependency 'MJExtension'
  end
  
  # SafeUtils仓库
  s.subspec 'SafeUtils' do |ss|
    ss.source_files = 'FSOCUtils/Classes/SafeUtils/*{h,m}'
  end
  
  # SizeScalieUtils仓库
  s.subspec 'SizeScalieUtils' do |ss|
    ss.source_files = 'FSOCUtils/Classes/SizeScalieUtils/*{h,m}'
  end
  
  # DeviceUtils仓库
  s.subspec 'DeviceUtils' do |ss|
    ss.source_files = 'FSOCUtils/Classes/DeviceUtils/*{h,m}'
  end
  
end
