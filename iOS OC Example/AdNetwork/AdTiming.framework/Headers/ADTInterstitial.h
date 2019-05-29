//
//  ADTInterstitial.h
//  AdTiming SDK
//
//  Copyright 2017 AdTiming Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ADTInterstitialDelegate.h"
#import "ADTAdBase.h"

NS_ASSUME_NONNULL_BEGIN

/// A modal view controller to represent a AdTiming interstitial ad. This is a full-screen ad shown in your application.
@interface ADTInterstitial : ADTAdBase

/// the delegate
@property (nonatomic, weak)id<ADTInterstitialDelegate> delegate;

/// The interstitial's ad placement ID.
- (NSString*)placementID;

/// This is a method to initialize an ADTInterstitial matching the given placement id.
/// Parameter placementID: The id of the ad placement.
- (instancetype)initWithPlacementID:(NSString *)placementID;


/// Indicates whether the video is ready to show ad.
- (BOOL)isReady;


/// Begins loading the ADTInterstitial content.
/// You can implement `ADTInterstitialDidLoad:` and `ADTInterstitial:didFailWithError:` methods of `ADTInterstitialDelegate` if you would like to be notified as loading succeeds or fails.
- (void)load;

/// Presents the interstitial ad modally from the specified view controller.
/// You can implement `ADTInterstitialDidClick:` and `ADTInterstitialDidClose:`methods of `ADTInterstitialDelegate` if you would like to stay informed for thoses events
- (void)show;

/// Presents the interstitial ad modally from the specified view controller.
/// Parameter viewController: The view controller that will be used to present the interstitial ad.
- (void)showWithRootViewController:(UIViewController *)rootViewController;

@end

NS_ASSUME_NONNULL_END
