//
//  VideoViewController.m
//  iOS OC Example
//
//  Created by M on 2019/5/28.
//  Copyright © 2019 1tu1shu. All rights reserved.
//

#import "VideoViewController.h"
#import <AdTiming/AdTiming.h>

@interface VideoViewController ()<ADTVideoAdDelegate>

@property(nonatomic,strong)UIButton *loadBtn;
@property(nonatomic,strong)UIButton *showBtn;
@property(nonatomic,strong)UILabel *logLabel;

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Video";
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
    
    // Setting Video Delegate
    [ADTVideoAd sharedInstance].delegate = self;
}

-(void)loadBtnDidClicked
{
    // LoadVideo
    [[ADTVideoAd sharedInstance]loadWithPlacmentID:@"5508"];
}

-(void)showBtnDidClicked
{
    // isAdReady
    [[ADTVideoAd sharedInstance] isReady:@"5508"];
    
    // ShowVideo
    [[ADTVideoAd sharedInstance]show:@"5508"];
}

#pragma mark -- ADTVideoAdDelegate
- (void)ADTVideoAdDidload:(NSString*)placementID{
    NSLog(@"videoAdDidLoad");
    self.logLabel.text = @"load success";
}
- (void)ADTVideoAdDidFailToLoad:(NSString*)placementID error:(NSError*)error{
    NSLog(@"videoAd didFail");
    self.logLabel.text = @"load fail";
}
- (void)ADTVideoAdDidStart:(NSString*)placementID{
    NSLog(@"VideoAdStartPlay");
    self.logLabel.text = @"";
}
- (void)ADTVideoAdDidClick:(NSString*)placementID{
    NSLog(@"videoAdDidClick");
}
- (void)ADTVideoAdDidClose:(NSString*)placementID finishState:(ADTVideoAdFinishState)state{
    if(state == ADTVideoAdFinishStateSkipped){
        NSLog(@"VideoAdFinishPlay(skip)");
    } else if (state == ADTVideoAdFinishStateCompleted){
        NSLog(@"VideoAdFinishPlay(complete)");
    }
}

@end
