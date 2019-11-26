//
//  AdTimingNativeDelegate.h
//  AdTiming SDK
//
//  Copyright 2017 AdTiming Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AdTimingNative;
@class AdTimingNativeAd;

NS_ASSUME_NONNULL_BEGIN

/// The methods declared by the AdTimingNativeDelegate protocol allow the adopting delegate to respond to messages from the AdTimingNative class and thus respond to operations such as whether the native ad has been loaded.
@protocol AdTimingNativeDelegate<NSObject>

@optional

/// Sent when an AdTimingNative has been successfully loaded.
- (void)adtimingNative:(AdTimingNative*)native didLoad:(AdTimingNativeAd*)nativeAd;

/// Sent when an AdTimingNative is failed to load.
- (void)adtimingNative:(AdTimingNative*)native didFailWithError:(NSError*)error;

/// Sent immediately before the impression of an AdTimingNative object will be logged.
- (void)adtimingNativeWillExposure:(AdTimingNative*)native;

/// Sent after an ad has been clicked by the person.
- (void)adtimingNativeDidClick:(AdTimingNative*)native;

@end

NS_ASSUME_NONNULL_END
