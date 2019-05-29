//
//  InterstitialViewController.m
//  iOS OC Example
//
//  Created by M on 2019/5/28.
//  Copyright © 2019 1tu1shu. All rights reserved.
//

#import "InterstitialViewController.h"
#import <AdTiming/AdTiming.h>

@interface InterstitialViewController ()<ADTInterstitialDelegate>

@property (nonatomic, strong) ADTInterstitial *interstitial;

@property(nonatomic,strong)UIButton *loadBtn;
@property(nonatomic,strong)UIButton *showBtn;
@property(nonatomic,strong)UILabel *logLabel;

@end

@implementation InterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Interstitial";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.loadBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.loadBtn.frame = CGRectMake(20, 120, 120, 30);
    [self.loadBtn setTitle:@"Load" forState:UIControlStateNormal];
    self.loadBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.loadBtn.backgroundColor = [UIColor whiteColor];
    self.loadBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    self.loadBtn.layer.cornerRadius = 5;
    [self.loadBtn addTarget:self action:@selector(loadBtnDidClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loadBtn];
    
    self.showBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.showBtn.frame = CGRectMake(20, CGRectGetMaxY(self.loadBtn.frame)+20, 120, 30);
    [self.showBtn setTitle:@"Show" forState:UIControlStateNormal];
    self.showBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.showBtn.backgroundColor = [UIColor whiteColor];
    self.showBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    self.showBtn.layer.cornerRadius = 5;
    [self.showBtn addTarget:self action:@selector(showBtnDidClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.showBtn];
    
    self.logLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.showBtn.frame)+20, self.view.frame.size.width-40, 30)];
    self.logLabel.text = @"Log";
    self.logLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:self.logLabel];
    
    // Create InterstitialView
    self.interstitial = [[ADTInterstitial alloc] initWithPlacementID:@"121"];
    self.interstitial.delegate = self;

}

-(void)loadBtnDidClicked
{
    // LoadInterstitial
    [self.interstitial load];
}

-(void)showBtnDidClicked
{
    // ShowInterstitial
    [self.interstitial showWithRootViewController:self];
}

#pragma mark -- ADTInterstitialDelegate
- (void)ADTInterstitialDidLoad:(ADTInterstitial *)interstitial {
    NSLog(@"interstitialAdDidLoad");
    self.logLabel.text = @"load success";
}
- (void)ADTInterstitial:(ADTInterstitial *)interstitial didFailWithError:(NSError *)error {
    NSLog(@"interstitialAd didFail");
    self.logLabel.text = @"load fail";
}
- (void)ADTInterstitialDidClick:(ADTInterstitial *)interstitial {
    NSLog(@"interstitialAdDidClick");
}
- (void)ADTInterstitialWillExposure:(ADTInterstitial *)interstitial {
    NSLog(@"interstitialAdWillExposure");
    self.logLabel.text = @"";
}
- (void)ADTInterstitialDidClose:(ADTInterstitial *)interstitial {
    NSLog(@"interstitialAdDidClose");
}

@end
