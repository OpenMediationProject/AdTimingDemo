//
//  ADTNativeDelegate.h
//  AdTiming SDK
//
//  Copyright 2017 AdTiming Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ADTNative;
@class ADTNativeAd;

NS_ASSUME_NONNULL_BEGIN

/// The methods declared by the ADTNativeDelegate protocol allow the adopting delegate to respond to messages from the ADTNative class and thus respond to operations such as whether the native ad has been loaded.
@protocol ADTNativeDelegate<NSObject>

@optional

/// Sent when an ADTNative has been successfully loaded.
- (void)ADTNative:(ADTNative*)native didLoad:(ADTNativeAd*)nativeAd;

/// Sent when an ADTNative is failed to load.
- (void)ADTNative:(ADTNative*)native didFailWithError:(NSError*)error;

/// Sent immediately before the impression of an ADTNative object will be logged.
- (void)ADTNativeWillExposure:(ADTNative*)native;

/// Sent after an ad has been clicked by the person.
- (void)ADTNativeDidClick:(ADTNative*)native;

@end

NS_ASSUME_NONNULL_END
