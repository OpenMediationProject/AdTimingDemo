//
//  AdTimingVideoAd.h
//  AdTiming SDK
//
//  Copyright 2017 AdTiming Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AdTimingAdSingletonInterface.h"
#import "AdTimingRewardedVideoDelegate.h"

NS_ASSUME_NONNULL_BEGIN

/// A modal view controller to represent a rewarded video ad. This is a full-screen ad shown in your application.
@interface AdTimingRewardedVideoAd : AdTimingAdSingletonInterface

/// Returns the singleton instance.
+ (instancetype)sharedInstance;

/// Add delegate
- (void)addDelegate:(id<AdTimingRewardedVideoDelegate>)delegate;

/// Remove delegate
- (void)removeDelegate:(id<AdTimingRewardedVideoDelegate>)delegate;

/// Indicates whether the rewarded video is ready to show ad.
- (BOOL)isReady;

/// Indicates whether the scene has reached the display frequency.
- (BOOL)isCappedForScene:(NSString *)sceneName;

/// Presents the rewarded video ad modally from the specified view controller.
/// Parameter viewController: The view controller that will be used to present the video ad.
/// Parameter sceneName: The name of th ad scene.
- (void)showWithViewController:(UIViewController *)viewController scene:(NSString *)sceneName;

/// Presents the rewarded video ad modally from the specified view controller.
/// Parameter viewController: The view controller that will be used to present the video ad.
/// Parameter sceneName: The name of th ad scene.
/// Parameter extraParams: Exciting video Id.
- (void)showWithViewController:(UIViewController *)viewController scene:(NSString *)sceneName extraParams:(NSString*)extraParams;

@end

NS_ASSUME_NONNULL_END
