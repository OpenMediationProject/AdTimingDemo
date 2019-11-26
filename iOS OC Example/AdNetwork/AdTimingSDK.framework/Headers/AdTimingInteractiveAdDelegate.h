//
//  AdTimingInteractiveAdDelegate.h
//  AdTiming
//
//  Created by M on 2019/10/18.
//  Copyright © 2019 AdTiming. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdTimingScene.h"

NS_ASSUME_NONNULL_BEGIN

@protocol AdTimingInteractiveAdDelegate <NSObject>

@optional

/// Invoked when a interactive is available.
- (void)adtimingInteractiveChangedAvailability:(BOOL)available;

/// Sent immediately when a interactive ad is opened.
- (void)adtimingInteractiveDidOpen:(AdTimingScene*)scene;

/// Sent immediately when a interactive ad starts to play.
- (void)adtimingInteractiveDidShow:(AdTimingScene*)scene;

/// Sent after a interstitial ad has been clicked.
- (void)adtimingInteractiveDidClick:(AdTimingScene*)scene;

/// Sent after a interactive ad has been closed.
- (void)adtimingInteractiveDidClose:(AdTimingScene*)scene;

/// Sent after a interactive ad has failed to play.
- (void)adtimingInteractiveDidFailToShow:(AdTimingScene*)scene withError:(NSError *)error;

@end

NS_ASSUME_NONNULL_END
