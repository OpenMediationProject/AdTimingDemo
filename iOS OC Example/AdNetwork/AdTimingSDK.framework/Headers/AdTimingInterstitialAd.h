//
//  AdTimingInterstitialAd.h
//  AdTiming
//
//  Created by M on 2019/6/14.
//  Copyright © 2019 AdTiming. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AdTimingAdSingletonInterface.h"
#import "AdTimingInterstitialAdDelegate.h"


NS_ASSUME_NONNULL_BEGIN

@interface AdTimingInterstitialAd : AdTimingAdSingletonInterface

/// Returns the singleton instance.
+ (instancetype)sharedInstance;

/// Add delegate
- (void)addDelegate:(id<AdTimingInterstitialAdDelegate>)delegate;

/// Remove delegate
- (void)removeDelegate:(id<AdTimingInterstitialAdDelegate>)delegate;

/// Indicates whether the interstitial video is ready to show ad.
- (BOOL)isReady;

/// Indicates whether the scene has reached the display frequency.
- (BOOL)isCappedForScene:(NSString *)sceneName;

/// Presents the interstitial video ad modally from the specified view controller.
/// Parameter viewController: The view controller that will be used to present the video ad.
/// Parameter sceneName: The name of th ad scene. Default scene if null.
- (void)showWithViewController:(UIViewController *)viewController scene:(NSString *)sceneName;

@end

NS_ASSUME_NONNULL_END
