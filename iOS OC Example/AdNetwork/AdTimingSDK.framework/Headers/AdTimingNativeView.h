//
//  AdTimingNativeView.h
//  AdTiming SDK
//
//  Copyright 2017 AdTiming Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AdTimingNativeAd;
#import "AdTimingNativeMediaView.h"

NS_ASSUME_NONNULL_BEGIN

/// A customized UIView to represent a ad (native ad).
@interface AdTimingNativeView : UIView

@property (nonatomic, strong) AdTimingNativeAd *nativeAd;
@property (nonatomic, strong) AdTimingNativeMediaView *mediaView;

/// This is a method to initialize an AdTimingNativeView.
/// Parameter frame: the AdTimingNativeView frame.
- (instancetype)initWithFrame:(CGRect)frame;

- (void)setFbNativeClickableViews:(NSArray<UIView *> *)clickableViews;

@end

NS_ASSUME_NONNULL_END
