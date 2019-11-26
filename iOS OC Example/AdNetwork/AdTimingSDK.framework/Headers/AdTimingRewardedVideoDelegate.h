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

/// Invoked when a rewarded video is available.
- (void)adtimingRewardedVideoChangedAvailability:(BOOL)available;

/// Sent immediately when a rewarded video is opened.
- (void)adtimingRewardedVideoDidOpen:(AdTimingScene*)scene;

/// Sent immediately when a rewarded video starts to play.
- (void)adtimingRewardedVideoPlayStart:(AdTimingScene*)scene;

/// Send after a rewarded video has been completed.
- (void)adtimingRewardedVideoPlayEnd:(AdTimingScene*)scene;

/// Sent after a rewarded video has been clicked.
- (void)adtimingRewardedVideoDidClick:(AdTimingScene*)scene;

/// Sent after a user has been granted a reward.
- (void)adtimingRewardedVideoDidReceiveReward:(AdTimingScene*)scene;

/// Sent after a rewarded video has been closed.
- (void)adtimingRewardedVideoDidClose:(AdTimingScene*)scene;

/// Sent after a rewarded video has failed to play.
- (void)adtimingRewardedVideoDidFailToShow:(AdTimingScene*)scene withError:(NSError *)error;

@end

NS_ASSUME_NONNULL_END
