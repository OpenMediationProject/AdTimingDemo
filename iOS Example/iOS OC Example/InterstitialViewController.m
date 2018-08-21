//
//  InterstitialViewController.m
//  iOS OC Example
//
//  Created by 公司 on 2018/6/13.
//

#import "InterstitialViewController.h"
#import <ADTiming/ADTiming.h>

@interface InterstitialViewController () <ATInterstitialDelegate> {
    ATInterstitial *_interstitial;
}

@end

@implementation InterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ATInterstitial *interstitial = [[ATInterstitial alloc] init:@"121"];
    interstitial.delegate = self;
    _interstitial = interstitial;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)load:(id)sender {
    [_interstitial load];
}

- (IBAction)show:(id)sender {
    [_interstitial show:self];
}

- (void)atInterstitialDidLoad:(ATInterstitial *)interstitial {
    NSLog(@"interstitialAdDidLoad");
}

- (void)atInterstitial:(ATInterstitial *)interstitial failWithError:(NSError *)error {
    NSLog(@"interstitialAddidFail");
}

- (void)atInterstitialWillExposure:(ATInterstitial *)interstitial {
    NSLog(@"interstitialAdWillExposure");
}

- (void)atInterstitialDidClick:(ATInterstitial *)interstitial {
    NSLog(@"interstitialAdDidClick");
}

- (void)atInterstitialDidClose:(ATInterstitial *)interstitial {
    NSLog(@"interstitialAdDidClose");
}

@end
