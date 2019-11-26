//
//  AdTimingNative.h
//  AdTiming SDK
//
//  Copyright 2017 AdTiming Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AdTimingAdBase.h"
#import "AdTimingNativeDelegate.h"

NS_ASSUME_NONNULL_BEGIN

/// The AdTimingNative represents ad metadata to allow you to construct custom ad views.
@interface AdTimingNative : AdTimingAdBase

/// the delegate
@property(nonatomic, weak, nullable) id<AdTimingNativeDelegate> delegate;

/// The native's ad placement ID.
- (NSString*)placementID;

/// This is a method to initialize an AdTimingNative.
/// placementID: Typed access to the id of the ad placement.
- (instancetype)initWithPlacementID:(NSString*)placementID;

/// This is a method to initialize an AdTimingNative.
/// placementID: Typed access to the id of the ad placement.
/// viewController: The view controller that will be used to present the ad and the app store view.
- (instancetype)initWithPlacementID:(NSString*)placementID rootViewController:(UIViewController*)viewController;

/// Begins loading the AdTimingNative content.
- (void)loadAd;
@end

NS_ASSUME_NONNULL_END
