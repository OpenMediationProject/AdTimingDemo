//
//  InterstitialViewController.m
//  iOS OC Example
//
//  Created by 公司 on 2018/6/13.
//

#import "InterstitialViewController.h"

@import AdTiming;
@interface InterstitialViewController () <ADTInterstitialDelegate>

@property (nonatomic, strong) ADTInterstitial *interstitial;

@end

@implementation InterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)load:(id)sender {
    [self.interstitial load];
}

- (IBAction)show:(id)sender {
    [self.interstitial showWithRootViewController:self];
}

- (void)adtInterstitialDidLoad:(ADTInterstitial *)adtInterstitial {
    NSLog(@"广告加载完成");
}

- (void)adtInterstitial:(nonnull ADTInterstitial *)adtInterstitial didFailWithError:(nonnull NSError *)error {
    NSLog(@"广告加载失败");
}


- (void)adtInterstitialDidClick:(nonnull ADTInterstitial *)adtInterstitial {
    NSLog(@"广告被点击");
}


- (void)adtInterstitialDidClose:(nonnull ADTInterstitial *)adtInterstitial {
    NSLog(@"广告已经关闭");
}


- (void)adtInterstitialWillExposure:(nonnull ADTInterstitial *)adtInterstitial {
    NSLog(@"广告将要展示");
}

- (ADTInterstitial*)interstitial{
    if(!_interstitial){
        _interstitial = [[ADTInterstitial alloc] initWithPlacementID:@"121"];
        _interstitial.delegate = self;
    }
    return _interstitial;
}

@end
