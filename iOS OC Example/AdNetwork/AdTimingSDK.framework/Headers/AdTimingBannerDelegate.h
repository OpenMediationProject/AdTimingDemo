//
//  AdTimingBannerDelegate.h
//  AdTiming SDK
//
//  Copyright 2017 AdTiming Inc. All rights reserved.
//
#import <Foundation/Foundation.h>

@class AdTimingBanner;

NS_ASSUME_NONNULL_BEGIN

/// The methods declared by the AdTimingBannerDelegate protocol allow the adopting delegate to respond to messages from the AdTimingBanner class and thus respond to operations such as whether the ad has been loaded, the person has clicked the ad.
@protocol AdTimingBannerDelegate<NSObject>

@optional

/// Sent when an ad has been successfully loaded.
- (void)adtimingBannerDidLoad:(AdTimingBanner *)banner;

/// Sent after an AdTimingBanner fails to load the ad.
- (void)adtimingBanner:(AdTimingBanner *)banner didFailWithError:(NSError *)error;

/// Sent immediately before the impression of an AdTimingBanner object will be logged.
- (void)adtimingBannerWillExposure:(AdTimingBanner *)banner;

/// Sent after an ad has been clicked by the person.
- (void)adtimingBannerDidClick:(AdTimingBanner *)banner;

@end

NS_ASSUME_NONNULL_END
