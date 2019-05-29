//
//  ADTVideoAdDelegate.h
//  AdTiming SDK
//
//  Copyright 2017 AdTiming Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// An enumeration for the completion state of an ad.
typedef NS_ENUM(NSInteger, ADTVideoAdFinishState) {
    /// A state that indicates that the user skipped the ad.
    ADTVideoAdFinishStateSkipped,
    /// A state that indicates that the ad was played entirely.
    ADTVideoAdFinishStateCompleted
};

@protocol ADTVideoAdDelegate <NSObject>

@optional

/// Sent when an ad has been successfully loaded.
- (void)ADTVideoAdDidload:(NSString*)placementID;

/// Sent after an ATVideo fails to load the ad.
- (void)ADTVideoAdDidFailToLoad:(NSString*)placementID error:(NSError*)error;

/// Sent immediately before the impression of an ATVideo object will be logged.
- (void)ADTVideoAdDidStart:(NSString*)placementID;

/// Sent after an ad has been clicked by the person.
- (void)ADTVideoAdDidClick:(NSString*)placementID;

/// Sent after an ATVideo did Finish play and close.
- (void)ADTVideoAdDidClose:(NSString*)placementID finishState:(ADTVideoAdFinishState)state;

@end

NS_ASSUME_NONNULL_END
