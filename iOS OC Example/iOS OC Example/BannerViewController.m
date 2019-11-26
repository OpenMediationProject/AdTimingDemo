//
//  BannerViewController.m
//  iOS OC Example
//
//  Created by M on 2019/5/28.
//  Copyright © 2019 1tu1shu. All rights reserved.
//

#import "BannerViewController.h"
#import <AdTimingSDK/AdTimingSDK.h>

@interface BannerViewController () <AdTimingBannerDelegate>

@property(nonatomic,strong)UIButton *loadBtn;
@property(nonatomic,strong)UILabel *logLabel;

@property (nonatomic, strong) AdTimingBanner *banner;

@end

@implementation BannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Banner";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.loadBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.loadBtn.frame = CGRectMake(20, 120, 120, 30);
    [self.loadBtn setTitle:@"Load&Show" forState:UIControlStateNormal];
    self.loadBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.loadBtn.backgroundColor = [UIColor whiteColor];
    self.loadBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    self.loadBtn.layer.cornerRadius = 5;
    [self.loadBtn addTarget:self action:@selector(loadBtnDidClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loadBtn];
    
    self.logLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.loadBtn.frame)+20, self.view.frame.size.width-40, 30)];
    self.logLabel.text = @"Log";
    self.logLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:self.logLabel];
}

#pragma mark -- Create BannerView

- (AdTimingBanner*)banner{
    if(!_banner){
        _banner = [[AdTimingBanner alloc] initWithBannerType:AdTimingBannerTypeDefault placementID:@"111"];
        [_banner addLayoutAttribute:AdTimingBannerLayoutAttributeHorizontally constant:0];
        [_banner addLayoutAttribute:AdTimingBannerLayoutAttributeVertically constant:0];
        _banner.delegate = self;
        [self.view addSubview:_banner];
    }
    return _banner;
}


-(void)loadBtnDidClicked
{
    // load&show Banner
    [self.banner loadAndShow];
}

/// Invoked when the banner ad is available.
- (void)adtimingBannerDidLoad:(AdTimingBanner *)banner {
    NSLog(@"BannerAd Did Load");
    self.logLabel.text = @"load success";
}

/// Invoked when the call to load a banner has failed.
/// Parameter error contains the reason for the failure.
- (void)adtimingBanner:(AdTimingBanner *)banner didFailWithError:(NSError *)error {
    NSLog(@"BannerAd Did Fail");
}

/// Invoked when the banner ad is showing.
- (void)adtimingBannerWillExposure:(AdTimingBanner *)banner {
    NSLog(@"BannerAd Will Exposure");
}

/// Invoked when the user clicks on the banner ad.
- (void)adtimingBannerDidClick:(AdTimingBanner *)banner {
    NSLog(@"BannerAd Did Click");
}

@end
