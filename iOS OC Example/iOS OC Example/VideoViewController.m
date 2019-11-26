//
//  VideoViewController.m
//  iOS OC Example
//
//  Created by M on 2019/5/28.
//  Copyright © 2019 1tu1shu. All rights reserved.
//

#import "VideoViewController.h"
#import <AdTimingSDK/AdTimingSDK.h>

@interface VideoViewController ()<AdTimingRewardedVideoDelegate>

@property(nonatomic,strong)UIButton *loadBtn;
@property(nonatomic,strong)UIButton *showBtn;
@property(nonatomic,strong)UILabel *logLabel;

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Video";
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
    
    // Setting Video Delegate
    [[AdTimingRewardedVideoAd sharedInstance] addDelegate:self];
}


-(void)showBtnDidClicked
{
    // ShowVideo
    if ([[AdTimingRewardedVideoAd sharedInstance] isReady]) {
        [[AdTimingRewardedVideoAd sharedInstance] showWithViewController:self scene:@"YOUR_SCENE_NAME"];
    }
}

/// Invoked when rewarded video is available.
/// You can then show the video by calling the show method.
- (void)adtmingRewardedVideoChangedAvailability:(BOOL)available{
     if(available){
        NSLog(@"VideoAd is Available");
     }
}

/// Sent immediately when a rewarded video is opened.
- (void)adtimingRewardedVideoDidOpen:(AdTimingScene *)scene{
     NSLog(@"VideoAd Start Play");
}

/// Sent immediately when a rewarded video starts to play.
- (void)adtimingRewardedVideoPlayStart:(AdTimingScene *)scene{
     NSLog(@"VideoAd Start Play");
}

/// Sent after a rewarded video has been clicked.
- (void)adtimingRewardedVideoDidClick:(AdTimingScene *)scene{
     NSLog(@"VideoAd Did Click");
}

/// Send after a rewarded video has been completed.
- (void)adtimingRewardedVideoPlayEnd:(AdTimingScene *)scene{
     NSLog(@"VideoAd Play End");
}

/// Sent after a rewarded video has been closed.
- (void)timingRewardedVideoDidClose:(AdTimingScene *)scene{
     NSLog(@"VideoAd Did Close");
}

/// Sent after a user has been granted a reward.
- (void)adtimingRewardedVideoDidReceiveReward:(AdTimingScene *)scene{
     NSLog(@"Receive a reward");
}

/// Sent after a rewarded video has failed to play.
- (void)adtimingRewardedVideoDidFailToShow:(AdTimingScene *)scene withError:(NSError *)error{
     NSLog(@"VideoAd failed to play");
}

@end
