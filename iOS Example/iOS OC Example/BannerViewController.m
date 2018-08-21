//
//  BannerViewController.m
//  iOS OC Example
//
//  Created by 公司 on 2018/6/13.
//

#import "BannerViewController.h"
#import <ADTiming/ADTiming.h>

@interface BannerViewController () <ATBannerViewDelegate>
@property (nonatomic , strong)ATBannerView *bannerView;
@end

@implementation BannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadShow:(id)sender {
    if (!_bannerView) {
        _bannerView = [[ATBannerView alloc] initWithFrame:CGRectZero adSize:ATBannerTypeNormal];
        _bannerView.placementId = @"541";
        _bannerView.delegate = self;
        _bannerView.center = CGPointMake(self.view.center.x, self.view.center.y);
        _bannerView.rootViewController = self;
        [self.view addSubview:_bannerView];
    }
    [_bannerView loadAndShow];
}

- (void)atBannerDidLoad:(ATBannerView *)banner {
    NSLog(@"bannerAdDidLoad");
}

- (void)atBanner:(ATBannerView *)banner failWithError:(NSError *)error {
    NSLog(@"bannerAddidFail");
}

- (void)atBannerWillExposure:(ATBannerView *)banner {
    NSLog(@"bannerAdWillExposure");
}

- (void)atBannerDidClick:(ATBannerView *)banner {
    NSLog(@"bannerAdDidClick");
}

@end
