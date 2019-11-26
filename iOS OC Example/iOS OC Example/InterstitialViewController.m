//
//  InterstitialViewController.m
//  iOS OC Example
//
//  Created by M on 2019/5/28.
//  Copyright © 2019 1tu1shu. All rights reserved.
//

#import "InterstitialViewController.h"
#import <AdTimingSDK/AdTimingSDK.h>

@interface InterstitialViewController ()<AdTimingInterstitialAdDelegate>

@property(nonatomic,strong)UIButton *loadBtn;
@property(nonatomic,strong)UIButton *showBtn;
@property(nonatomic,strong)UILabel *logLabel;

@end

@implementation InterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Interstitial";
    self.view.backgroundColor = [UIColor whiteColor];
    
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
    
    // Setting Interstitial Delegate
    [[AdTimingInterstitialAd sharedInstance] addDelegate:self];
    
}

-(void)showBtnDidClicked
{
    // ShowInterstitial
    if ([[AdTimingInterstitialAd sharedInstance] isReady]) {
        [[AdTimingInterstitialAd sharedInstance] showWithViewController:self scene:@"YOUR_SCENE_NAME"];
    }
}

/// Invoked when interstitial video is available.
/// You can then show the video by calling show method.
- (void)adtimingInterstitialChangedAvailability:(BOOL)available{
    if(available){
        NSLog(@"InterstitialAd Did Load");
    }
}

/// Sent immediately when a interstitial video starts to play.
- (void)adtimingInterstitialDidShow:(AdTimingScene *)scene{
    NSLog(@"InterstitialAd Start Play");
}

/// Sent immediately when a interstitial video is opened.
- (void)adtimingInterstitialDidOpen:(AdTimingScene *)scene{
    NSLog(@"InterstitialAd Start Play");
}

/// Sent after a interstitial video has been clicked.
- (void)adtimingInterstitialDidClick:(AdTimingScene *)scene{
    NSLog(@"InterstitialAd Did Click");
}

/// Sent after a interstitial video has been closed.
- (void)adtimingInterstitialDidClose:(AdTimingScene *)scene{
    NSLog(@"InterstitialAd Did Close");
}

/// Sent after a interstitial video has failed to play.
- (void)adtimingInterstitialDidFailToShow:(AdTimingScene *)scene withError:(NSError *)error{
    NSLog(@"InterstitialAd failed to play");
}

@end
