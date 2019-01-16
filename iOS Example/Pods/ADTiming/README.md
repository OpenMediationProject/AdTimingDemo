![AdTiming: Ads in Swift](https://github.com/AdTiming-Swift/ADTimingSDKDemo/blob/master/AdTimingLogo.jpg?raw=true)

[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/ADTiming.svg)](https://img.shields.io/cocoapods/v/ADTiming.svg)
[![Platform](https://img.shields.io/cocoapods/p/ADTiming.svg?style=flat)](https://alamofire.github.io/ADTiming)
![Xcode 9.0+](https://img.shields.io/badge/Xcode-9.0%2B-blue.svg)
![iOS 8.0+](https://img.shields.io/badge/iOS-8.0%2B-blue.svg)
![Swift 4.0+](https://img.shields.io/badge/Swift-4.0%2B-orange.svg)
[![license](https://img.shields.io/github/license/AdTiming-Swift/ADTiming.svg)](https://github.com/AdTiming-Swift/ADTiming/blob/master/LICENSE)
[![中文 README](https://img.shields.io/badge/%E4%B8%AD%E6%96%87-README-blue.svg?style=flat)](https://github.com/AdTiming-Swift/ADTiming/blob/master/README.zh-cn.md)

AdTiming is an advertising aggregation platform and written in Swift.

- [AdTiming](#adTiming)
- [Communication](#communication)
- [Installation](#installation)
- [Get Started](#Get-Started)
- [Usage](https://github.com/Alamofire/Alamofire/blob/master/Documentation/Usage.md)
   - **NATIVE -** [Create](https://github.com/AdTiming-Swift/AdTiming/blob/master/Documentation/Usage.md#create-nativeView-and-loader), [Load](https://github.com/AdTiming-Swift/AdTiming/blob/master/Documentation/Usage.md#loadNative), [Show](https://github.com/AdTiming-Swift/AdTiming/blob/master/Documentation/Usage.md#showNative), [Delegate](https://github.com/AdTiming-Swift/AdTiming/blob/master/Documentation/Usage.md#nativeDelegate(ATNativeLoaderDelegate))
   - **BANNER -** [Create](https://github.com/AdTiming-Swift/AdTiming/blob/master/Documentation/Usage.md#create-bannerView), [Load&Show](https://github.com/AdTiming-Swift/AdTiming/blob/master/Documentation/Usage.md#load&ShowBanner), [Delegate](https://github.com/AdTiming-Swift/AdTiming/blob/master/Documentation/Usage.md#bannerDelegate(ATBannerViewDelegate))
   - **VIDEO -** [SetDelegate](https://github.com/AdTiming-Swift/AdTiming/blob/master/Documentation/Usage.md#setting-video-delegate), [Load](https://github.com/AdTiming-Swift/AdTiming/blob/master/Documentation/Usage.md#loadVideo), [isReady](https://github.com/AdTiming-Swift/AdTiming/blob/master/Documentation/Usage.md#is-ad-ready(Optional)), [Show](https://github.com/AdTiming-Swift/AdTiming/blob/master/Documentation/Usage.md#showVideo), [Delegate](https://github.com/AdTiming-Swift/AdTiming/blob/master/Documentation/Usage.md#videoDelegate(ATVideoDelegate))
   - **INTERSTITIAL -** [Create](https://github.com/AdTiming-Swift/AdTiming/blob/master/Documentation/Usage.md#create-interstitialView), [Load](https://github.com/AdTiming-Swift/AdTiming/blob/master/Documentation/Usage.md#loadInterstitial), [Show](https://github.com/AdTiming-Swift/AdTiming/blob/master/Documentation/Usage.md#showInterstitial), [Delegate](https://github.com/AdTiming-Swift/AdTiming/blob/master/Documentation/Usage.md#interstitialDelegate(ATInterstitialDelegate))
- [Advanced Usage](https://github.com/Alamofire/Alamofire/blob/master/Documentation/AdvancedUsage.md)
- [FAQ](#faq)

## AdTiming
AdTiming is the world's leading mobile marketing platform. And to show ads by aggregation this new type.We solved the development and debugging time for developers to load multiple advertising platforms and saved a lot of development costs.
We also use aggregated to improve fill in your app, also can improve your profit.

## Communication

- If you **found a bug**, open an issue.

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1+ is required to build AdTiming 3.0+.

To integrate AdTiming into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'ADTiming'
end
```

Then, run the following command:

```bash
$ pod install
```

## Get Started

##### Find “Target” - “Building settings” - “Other Linker Flag”, Set its value to -ObjC or -all_load.(This step is very important, if you ignore the other platform ads will not be able to load)

##### Link Frameworks and Libraries
![Link Frameworks and Libraries](https://github.com/AdTiming-Swift/ADTimingSDKDemo/blob/master/Resource/EmbeddedBinaries.png?raw=true)

##### App Transport Security Settings
![App Transport Security Settings](https://github.com/AdTiming-Swift/ADTimingSDKDemo/blob/master/Resource/AppSetting.png?raw=true)

##### Framework use in Objective-C
![Objective-C Settings](https://github.com/AdTiming-Swift/ADTimingSDKDemo/blob/master/Resource/Objective-C_settings.png?raw=true)

##### How to get AppKey and PlacementId?
If you haven't [created an AdTiming account](http://www.adtiming.com/cn/signup.html) or [registered an app](https://publisher.adtiming.com/#/pubdev/publisher/publisher_placement.html) yet

If you are already our developer,Login to [adtiming](https://publisher.adtiming.com/#/pubdev/publisher/publisher_app.html) , as shown below

Get your AppKey

![AdTiming Get AppKey](https://github.com/AdTiming-Swift/ADTimingSDKDemo/blob/master/Resource/get_appkey.png?raw=true)

Get your PlacementId

![AdTiming Get PlacementId](https://github.com/AdTiming-Swift/ADTimingSDKDemo/blob/master/Resource/get_placementid.png?raw=true)

Now to load ADTiming

Swift

```swift
import ADTiming

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

    ATSDK.registSDK("YOUR_ADTIMING_APP_KEY")
    
    return true
}
```
Objective-C

```objectivec
#import <ADTiming/ADTiming.h>

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [ATSDK registSDK:"YOUR_ADTIMING_APP_KEY" success:^{
        // registApp Success
    }];
    
    return YES;
}
```

If you want to use other ad platforms at the same time please add the SDK you want to use.

Currently supported platforms：AdMob、Facebook、UntiyAds、Vungle、GDT.

Before using other platforms you need to import the framework of the platform you want to use.
