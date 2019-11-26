//
//  AdTiming.h
//  AdTiming SDK
//
//  Copyright 2017 AdTiming Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, AdTimingAdType) {
    AdTimingAdTypeBanner = (1 << 0),
    AdTimingAdTypeNative = (1 << 1),
    AdTimingAdTypeInterstitial = (1 << 2),
    AdTimingAdTypeRewardedVideo = (1 << 3),
    AdTimingAdTypeInteractive = (1 << 4),
};

typedef void(^initCompletionHandler)(NSError *_Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface AdTiming : NSObject

/// Initializes AdTiming's SDK with all the ad types that are defined in the platform.
+ (void)initWithAppKey:(NSString*)appKey;

/// Initializes AdTiming's SDK with the requested ad types.
+ (void)initWithAppKey:(NSString *)appKey adType:(AdTimingAdType)initAdTypes;

/// Check that `AdTiming` has been initialized
+ (BOOL)isInitialized;

/// current SDK version
+ (NSString *)SDKVersion;

/// setUserConsent @"0" is Refuse，@"1" is Accepted. Default is @"1"//GDPR
+ (void)setUserConsent:(NSString *)consent;

/// log enable,default is YES
+ (void)setLogEnable:(BOOL)logEnable;

/// user in-app purchase
+ (void)userPurchase:(CGFloat)amount currency:(NSString*)currencyUnit;

/// A tool to verify a successful integration of the AdTiming SDK and any additional adapters.
+ (void)validateIntegration;

@end

NS_ASSUME_NONNULL_END
