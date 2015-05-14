# Facebook-iOS-SDK-RACExtensions

[![CI Status](http://img.shields.io/travis/eagle-dan1349/Facebook-iOS-SDK-RACExtensions.svg?style=flat)](https://travis-ci.org/eagle-dan1349/Facebook-iOS-SDK-RACExtensions)
[![Version](https://img.shields.io/cocoapods/v/Facebook-iOS-SDK-RACExtensions.svg?style=flat)](http://cocoadocs.org/docsets/Facebook-iOS-SDK-RACExtensions)
[![License](https://img.shields.io/cocoapods/l/Facebook-iOS-SDK-RACExtensions.svg?style=flat)](http://cocoadocs.org/docsets/Facebook-iOS-SDK-RACExtensions)
[![Platform](https://img.shields.io/cocoapods/p/Facebook-iOS-SDK-RACExtensions.svg?style=flat)](http://cocoadocs.org/docsets/Facebook-iOS-SDK-RACExtensions)

Facebook-iOS-SDK-RACExtensions are a set of tools for [Facebook SDK for iOS](https://github.com/facebook/facebook-ios-sdk) aimed to bring work with Facebook to a better [Reactive World](https://github.com/ReactiveCocoa/ReactiveCocoa).

# WARNING
After Facebook SDK updated to version 4 with new architecture, this component is OUTDATED, for compatibility with new FBSDK take a look at [new extensions pack](https://github.com/eagle-dan1349/FBSDK-RACExtensions)

## Getting started

RACExtesions for Facebook iOS SDK provide convince around block-based methods of SDK.
Returned signals are cold (unles otherwise is stated) and start automatically upos subscription.
Result of requests, authorisation, etc are sent back to you the subscriber.

```Objective-C
FBSession* session = 
[[FBSession alloc] initWithPermissions:@[
                                                            @"public_profile",
                                                            @"email",
                                                            @"user_photos",
                                                            @"user_birthday"]];

[[session rac_open] 
 subscribeNext:^(RACTuple* sessionAndState)
 {
    //A tuple with (FBSession, FBSessionState)
 }
        error:^(NSError* error)
 {
    //Error if any
 }];
```

## Installation

Facebook-iOS-SDK-RACExtensions is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "Facebook-iOS-SDK-RACExtensions"

## Author

eagle-dan1349, eagle.dan.1349@gmail.com

## License

Facebook-iOS-SDK-RACExtensions is available under the MIT license. See the LICENSE file for more info.

Pull requests welcome!