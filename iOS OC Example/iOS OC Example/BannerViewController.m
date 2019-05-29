//
//  BannerViewController.m
//  iOS OC Example
//
//  Created by M on 2019/5/28.
//  Copyright © 2019 1tu1shu. All rights reserved.
//

#import "BannerViewController.h"
#import <AdTiming/AdTiming.h>

@interface BannerViewController () <ADTBannerDelegate>

@property(nonatomic,strong)UIButton *loadBtn;
@property(nonatomic,strong)UILabel *logLabel;

@property (nonatomic, strong) ADTBanner *banner;

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
- (ADTBanner*)banner{
    if(!_banner){
        _banner = [[ADTBanner alloc] initWithBannerType:ADTBannerTypeSmart placementID:@"111"];
        [_banner addLayoutAttribute:ADTBannerLayoutAttributeHorizontally constant:0];
        [_banner addLayoutAttribute:ADTBannerLayoutAttributeVertically constant:0];
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

#pragma mark -- ADTBannerDelegate
- (void)ADTBannerDidLoad:(ADTBanner *)banner {
    NSLog(@"bannerAdDidLoad");
    self.logLabel.text = @"load success";
}
- (void)ADTBanner:(ADTBanner *)banner didFailWithError:(NSError *)error {
    NSLog(@"bannerAd didFail");
    self.logLabel.text = @"load fail";
}
- (void)ADTBannerWillExposure:(ADTBanner *)banner {
    NSLog(@"bannerAdWillExposure");
    self.logLabel.text = @"";
}
- (void)ADTBannerDidClick:(ADTBanner *)banner {
    NSLog(@"bannerAdDidClick");
}


@end
