//
//  AdTimingRewardedVideoDelegate.h
//  AdTiming
//
//  Created by ylm on 2019/9/12.
//  Copyright © 2019 AdTiming. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdTimingScene.h"

NS_ASSUME_NONNULL_BEGIN

@protocol AdTimingRewardedVideoDelegate <NSObject>

@optional

/// Invoked whether a rewarded video is available.
- (void)adtimingRewardedVideoChangedAvailability:(BOOL)available;

/// Sent immediately when a rewarded video has been open.
- (void)adtimingRewardedVideoDidOpen:(AdTimingScene*)scene;

/// Sent immediately when a rewarded video has started to play.
- (void)adtimingRewardedVideoPlayStart:(AdTimingScene*)scene;

/// Send after when a rewarded video has completed.
- (void)adtimingRewardedVideoPlayEnd:(AdTimingScene*)scene;

/// Sent after when a rewarded video has been clicked.
- (void)adtimingRewardedVideoDidClick:(AdTimingScene*)scene;

/// Sent after when a user should be granted a reward.
- (void)adtimingRewardedVideoDidReceiveReward:(AdTimingScene*)scene;

/// Sent after when a rewarded video has been closed.
- (void)adtimingRewardedVideoDidClose:(AdTimingScene*)scene;

/// Sent after when a rewarded video failed to play.
- (void)adtimingRewardedVideoDidFailToShow:(AdTimingScene*)scene withError:(NSError *)error;

@end

NS_ASSUME_NONNULL_END
