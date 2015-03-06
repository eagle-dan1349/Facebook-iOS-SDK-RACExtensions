Pod::Spec.new do |s|
    s.name             = "Facebook-iOS-SDK-RACExtensions"
    s.version          = "0.0.1"
    s.summary          = "For thouse of you who love ReactiveCocoa and have to deal with Facebook, salvation is coming."
    s.homepage         = "https://github.com/eagle-dan1349/Facebook-iOS-SDK-RACExtensions"
    s.license          = 'MIT'
    s.author           = { "eagle-dan1349" => "eagle.dan.1349@gmail.com" }
    s.source           = { :git => "https://github.com/eagle-dan1349/Facebook-iOS-SDK-RACExtensions.git", :tag => s.version.to_s }
    
    s.platform     = :ios, '7.0'
    s.requires_arc = true
    
    s.source_files = 'Pod/Classes/**/*'
    s.resource_bundles = {
        'Facebook-iOS-SDK-RACExtensions' => ['Pod/Assets/*.png']
    }
    
    s.dependency 'ReactiveCocoa', "~> 2.4.7"
    s.dependency 'Facebook-iOS-SDK', "~> 3.23.0"
end
