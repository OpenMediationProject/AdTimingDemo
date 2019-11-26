//
//  NativeViewController.m
//  iOS OC Example
//
//  Created by M on 2019/5/28.
//  Copyright © 2019 1tu1shu. All rights reserved.
//

#import "NativeViewController.h"
#import <AdTimingSDK/AdTimingSDK.h>

@interface NativeViewController ()<AdTimingNativeDelegate>

@property (nonatomic, strong) AdTimingNative *native;
@property (nonatomic, strong) AdTimingNativeAd *nativeAd;
@property (nonatomic, strong) AdTimingNativeView *nativeView;
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *bodyLabel;

@property(nonatomic,strong)UIButton *loadBtn;
@property(nonatomic,strong)UIButton *showBtn;
@property(nonatomic,strong)UILabel *logLabel;

@end

@implementation NativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Native";
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
    
    // Create ADTNative
    self.native = [[AdTimingNative alloc]initWithPlacementID:@"109"];
    self.native.delegate = self;
    [self.view addSubview:self.nativeView];
    
}

- (AdTimingNativeView*)nativeView{
    if(!_nativeView){
        _nativeView = [[AdTimingNativeView alloc]initWithFrame:CGRectMake(0,300, self.view.frame.size.width, 300)];
        _nativeView.mediaView = [[AdTimingNativeMediaView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 300)];
        [_nativeView addSubview:_nativeView.mediaView];
        _iconView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        [_nativeView addSubview:_iconView];
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 270, self.view.frame.size.width, 15)];
        _titleLabel.font = [UIFont systemFontOfSize:13];
        [_nativeView addSubview:_titleLabel];
        _bodyLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 285, self.view.frame.size.width, 15)];
        _bodyLabel.font = [UIFont systemFontOfSize:13];
        [_nativeView addSubview:_bodyLabel];
    }
    return _nativeView;
}


-(void)loadBtnDidClicked
{
    // loadNative
    [self.native loadAd];
}

-(void)showBtnDidClicked
{
    // showNative
    self.nativeView.hidden = NO;
    self.nativeView.nativeAd = self.nativeAd;
    _iconView.image =[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.nativeAd.iconUrl]]];
    _titleLabel.text = self.nativeAd.title;
    _bodyLabel.text = self.nativeAd.body;
}

/// Invoked when the ad is available.
/// You can then show the ad.
- (void)adtimingNative:(AdTimingNative*)native didLoad:(AdTimingNativeAd*)nativeAd{
    NSLog(@"NativeAd Did Load");
    self.nativeAd = nativeAd;
    self.logLabel.text = @"load success";
}

/// Invoked when the call to load an ad has failed.
/// Parameter error contains the reason for the failure.
- (void)adtimingNative:(AdTimingNative*)native didFailWithError:(NSError*)error{
    NSLog(@"NativeAd Did Fail");
}

/// Invoked when the Ad begins to show.
- (void)adtimingNativeWillExposure:(AdTimingNative*)native{
    NSLog(@"NativeAd Will Exposure");
}

/// Invoked when the ad finishes playing.
- (void)adtimingNativeDidClick:(AdTimingNative*)native{
    NSLog(@"NativeAd Did Click");
}


@end
