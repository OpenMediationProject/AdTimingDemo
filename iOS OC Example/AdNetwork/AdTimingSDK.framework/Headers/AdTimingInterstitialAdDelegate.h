//
//  AdTimingInterstitialAdDelegate.h
//  AdTiming
//
//  Created by M on 2019/6/14.
//  Copyright © 2019 AdTiming. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdTimingScene.h"

NS_ASSUME_NONNULL_BEGIN

@protocol AdTimingInterstitialAdDelegate <NSObject>

@optional

/// Invoked when a interstitial video is available.
- (void)adtimingInterstitialChangedAvailability:(BOOL)available;

/// Sent immediately when a interstitial video is opened.
- (void)adtimingInterstitialDidOpen:(AdTimingScene*)scene;

/// Sent immediately when a interstitial video starts to play.
- (void)adtimingInterstitialDidShow:(AdTimingScene*)scene;

/// Sent after a interstitial video has been clicked.
- (void)adtimingInterstitialDidClick:(AdTimingScene*)scene;

/// Sent after a interstitial video has been closed.
- (void)adtimingInterstitialDidClose:(AdTimingScene*)scene;

/// Sent after a interstitial video has failed to play.
- (void)adtimingInterstitialDidFailToShow:(AdTimingScene*)scene withError:(NSError *)error;

@end

NS_ASSUME_NONNULL_END
