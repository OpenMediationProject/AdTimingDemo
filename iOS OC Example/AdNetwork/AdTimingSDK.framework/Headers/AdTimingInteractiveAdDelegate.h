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

/// Invoked whether a interactive is available.
- (void)adtimingInteractiveChangedAvailability:(BOOL)available;

/// Sent immediately when a interactive ad has been open.
- (void)adtimingInteractiveDidOpen:(AdTimingScene*)scene;

/// Sent immediately when a interactive ad has been shown.
- (void)adtimingInteractiveDidShow:(AdTimingScene*)scene;

/// Sent after when a interstitial ad has been clicked.
- (void)adtimingInteractiveDidClick:(AdTimingScene*)scene;

/// Sent after when a interactive ad has been closed.
- (void)adtimingInteractiveDidClose:(AdTimingScene*)scene;

/// Sent after when a interactive ad failed to play.
- (void)adtimingInteractiveDidFailToShow:(AdTimingScene*)scene withError:(NSError *)error;

@end

NS_ASSUME_NONNULL_END
