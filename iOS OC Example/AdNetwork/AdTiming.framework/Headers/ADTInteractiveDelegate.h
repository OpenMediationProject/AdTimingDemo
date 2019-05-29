//
//  ADTInteractiveDelegate.h
//  AdTiming
//
//  Created by ylm on 2019/2/14.
//  Copyright © 2019年 AdTiming. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class ADTInteractive;

@protocol ADTInteractiveDelegate <NSObject>

@optional

/// Sent when an ad has been successfully loaded.
- (void)ADTInteractiveDidLoad:(ADTInteractive*)interactive;

/// Sent after an ADTInteractive fails to load the ad.
- (void)ADTInteractive:(ADTInteractive*)interactive didFailWithError:(NSError*)error;

/// Sent immediately before the impression of an ADTInteractive object will be logged.
- (void)ADTInteractiveWillWillExposure:(ADTInteractive*)interactive;

/// Sent after an ADTInteractive did close.
- (void)ADTInteractiveDidClose:(ADTInteractive*)interactive;

@end

NS_ASSUME_NONNULL_END
