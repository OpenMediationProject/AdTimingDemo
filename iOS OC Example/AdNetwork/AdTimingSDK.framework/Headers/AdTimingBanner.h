//
//  AdTimingBanner.h
//  AdTimingiming SDK
//
//  Copyright 2017 AdTiming Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "AdTimingBannerDelegate.h"

NS_ASSUME_NONNULL_BEGIN

/// Banner Ad Size
typedef NS_ENUM(NSInteger, AdTimingBannerType) {
    AdTimingBannerTypeDefault = 0,       ///ad size: 320 x 50
    AdTimingBannerTypeLarge = 1,         ///ad size: 320 x 100
    AdTimingBannerTypeSmart = 2          ///ad size: screen.width x 50
};

/// Banner Ad layout attribute
typedef NS_ENUM(NSInteger, AdTimingBannerLayoutAttribute) {
    AdTimingBannerLayoutAttributeTop = 0,
    AdTimingBannerLayoutAttributeLeft = 1,
    AdTimingBannerLayoutAttributeBottom = 2,
    AdTimingBannerLayoutAttributeRight = 3,
    AdTimingBannerLayoutAttributeHorizontally = 4,
    AdTimingBannerLayoutAttributeVertically = 5
};

/// A customized UIView to represent a AdTimingiming ad (banner ad).
@interface AdTimingBanner : UIView

@property(nonatomic, readonly, nullable) NSString *placementID;

/// the delegate
@property (nonatomic, weak)id<AdTimingBannerDelegate> delegate;

/// The banner's ad placement ID.
- (NSString*)placementID;


/// This is a method to initialize an AdTimingBanner.
/// type: The size of the ad. Default is AdTimingBannerTypeDefault.
/// placementID: Typed access to the id of the ad placement.
- (instancetype)initWithBannerType:(AdTimingBannerType)type placementID:(NSString *)placementID;

/// set the banner position.
- (void)addLayoutAttribute:(AdTimingBannerLayoutAttribute)attribute constant:(CGFloat)constant;

/// Begins loading the AdTimingBanner content. And to show with default controller([UIApplication sharedApplication].keyWindow.rootViewController) when load success.
- (void)loadAndShow;

@end

NS_ASSUME_NONNULL_END
