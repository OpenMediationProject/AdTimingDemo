//
//  ADTBanner.h
//  AdTiming SDK
//
//  Copyright 2017 AdTiming Inc. All rights reserved.
//
#import <Foundation/Foundation.h>

@class ADTInterstitial;

NS_ASSUME_NONNULL_BEGIN

/// The methods declared by the ADTInterstitialDelegate protocol allow the adopting delegate to respond to messages from the ADTInterstitial class and thus respond to operations such as whether the interstitial ad has been loaded, user has clicked or closed the interstitial.
@protocol ADTInterstitialDelegate<NSObject>

@optional

/// Sent when an ad has been successfully loaded.
- (void)ADTInterstitialDidLoad:(ADTInterstitial *)interstitial;

/// Sent after an ADTInterstitial fails to load the ad.
- (void)ADTInterstitial:(ADTInterstitial *)interstitial didFailWithError:(NSError *)error;

/// Sent immediately before the impression of an ADTInterstitial object will be logged.
- (void)ADTInterstitialWillExposure:(ADTInterstitial *)interstitial;

/// Sent after an ad has been clicked by the person.
- (void)ADTInterstitialDidClick:(ADTInterstitial *)interstitial;

/// Sent after an ADTInterstitial object has been dismissed from the screen, returning control to your application.
- (void)ADTInterstitialDidClose:(ADTInterstitial *)interstitial;

@end

NS_ASSUME_NONNULL_END
