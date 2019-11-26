//
//  AdTimingInteractiveAd.h
//  AdTiming
//
//  Created by M on 2019/10/18.
//  Copyright © 2019 AdTiming. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AdTimingInteractiveAdDelegate.h"
#import "AdTimingAdSingletonInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface AdTimingInteractiveAd : AdTimingAdSingletonInterface

/// Returns the singleton instance.
+ (instancetype)sharedInstance;

/// Add delegate
- (void)addDelegate:(id<AdTimingInteractiveAdDelegate>)delegate;

/// Remove delegate
- (void)removeDelegate:(id<AdTimingInteractiveAdDelegate>)delegate;

/// Indicates whether the interactive is ready to show ad.
- (BOOL)isReady;

/// Indicates whether the scene has reached the display frequency.
- (BOOL)isCappedForScene:(NSString*)sceneName;

/// Presents the interactive ad modally from the specified view controller.
/// Parameter viewController: The view controller that will be used to present the video ad.
/// Parameter sceneName: The name of th ad scene.
- (void)showWithViewController:(UIViewController *)viewController scene:(NSString*)sceneName;


@end

NS_ASSUME_NONNULL_END
