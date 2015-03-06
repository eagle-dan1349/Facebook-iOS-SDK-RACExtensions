#
# Be sure to run `pod lib lint Facebook-iOS-SDK-RACExtensions.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Facebook-iOS-SDK-RACExtensions"
  s.version          = "0.0.1"
  s.summary          = "For thouse of you who love ReactiveCocoa and have to deal with Facebook"
  s.description      = <<-DESC
                       An optional longer description of Facebook-iOS-SDK-RACExtensions

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/<GITHUB_USERNAME>/Facebook-iOS-SDK-RACExtensions"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "eagle-dan1349" => "eagle.dan.1349@gmail.com" }
  s.source           = { :git => "https://github.com/<GITHUB_USERNAME>/Facebook-iOS-SDK-RACExtensions.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'Facebook-iOS-SDK-RACExtensions' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'ReactiveCocoa'
  s.dependency 'Facebook-iOS-SDK'
end