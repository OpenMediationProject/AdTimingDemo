![AdTiming: Ads in Swift](https://github.com/AdTiming-Swift/ADTimingSDKDemo/blob/master/AdTimingLogo.jpg?raw=true)

[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/ADTiming.svg)](https://img.shields.io/cocoapods/v/ADTiming.svg)
[![Platform](https://img.shields.io/cocoapods/p/ADTiming.svg?style=flat)](https://alamofire.github.io/ADTiming)
![Xcode 9.0+](https://img.shields.io/badge/Xcode-9.0%2B-blue.svg)
![iOS 8.0+](https://img.shields.io/badge/iOS-8.0%2B-blue.svg)
![Swift 4.0+](https://img.shields.io/badge/Swift-4.0%2B-orange.svg)
[![license](https://img.shields.io/github/license/AdTiming-Swift/ADTiming.svg)](https://github.com/AdTiming-Swift/ADTiming/blob/master/LICENSE)
[![英文 README](https://img.shields.io/badge/%E8%8B%B1%E6%96%87-README-blue.svg?style=flat)](https://github.com/AdTiming-Swift/ADTiming/blob/master/README.md)

AdTiming是一个聚合广告平台，并且用swift编写。

- [AdTiming](#adTiming)
- [沟通](#沟通)
- [获取framework](#获取framework)
- [开始使用](#开始使用)
- [加载广告](https://github.com/Alamofire/Alamofire/blob/master/Documentation/Usage.zh-cn.md)
- [高级使用](https://github.com/Alamofire/Alamofire/blob/master/Documentation/AdvancedUsage.zh-cn.md)
- [FAQ](#faq)

## AdTiming
AdTiming是全球领先的移动营销平台，并且通过聚合这种全新的模式去展示广告。AdTiming解决了开发人员加载多个广告平台的开发和调试时间，节省了大量开发成本。开发者使用聚合可以增加在App中的广告填充率，同时提高App的收益。

## 沟通

- 如果你 **发现一个Bug**, 通过issue联系我们.

## 获取framework

### CocoaPods

```bash
$ gem install cocoapods
```
将AdTiming添加到你的profile。

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'ADTiming'
end
```

然后运行:

```bash
$ pod install
```

## 开始使用

##### 需要将 “Target” - “Building settings” - “Other Linker Flag”, 设置成 -ObjC 或者 -all_load.(此步骤非常重要，如果忽略则其他平台广告会导致无法加载)

##### Link Frameworks and Libraries
![Link Frameworks and Libraries](https://github.com/AdTiming-Swift/ADTimingSDKDemo/blob/master/Resource/EmbeddedBinaries.png?raw=true)

##### App Transport Security Settings
![App Transport Security Settings](https://github.com/AdTiming-Swift/ADTimingSDKDemo/blob/master/Resource/AppSetting.png?raw=true)

##### 如果是Objective-C使用Framework
![Objective-C Settings](https://github.com/AdTiming-Swift/ADTimingSDKDemo/blob/master/Resource/Objective-C_settings.png?raw=true)

##### 如何获取AppKey和PlacementId?
如果你没有开发者账号[点击注册账号](http://www.adtiming.com/cn/signup.html)或者[注册一个广告位](https://publisher.adtiming.com/#/pubdev/publisher/publisher_placement.html)。


如果你已经是我们的开发者，可以登录[adtiming开发者后台](https://publisher.adtiming.com/#/pubdev/publisher/publisher_app.html) , 通过图中步骤获取

获取你的AppKey

![AdTiming Get AppKey](https://github.com/AdTiming-Swift/ADTimingSDKDemo/blob/master/Resource/get_appkey.png?raw=true)

获取你的PlacementId

![AdTiming Get PlacementId](https://github.com/AdTiming-Swift/ADTimingSDKDemo/blob/master/Resource/get_placementid.png?raw=true)

现在去加载ADTiming

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

如果你想同时使用其他广告平台请添加要使用的SDK。

目前支持的平台：AdMob、Facebook、UntiyAds、Vungle、广点通。

使用其他平台之前需要import你要使用的平台的framework。
