//
//  BannerViewController.m
//  iOS OC Example
//
//  Created by 公司 on 2018/6/13.
//

#import "BannerViewController.h"


@import AdTiming;
@interface BannerViewController () <ADTBannerDelegate>
@property (nonatomic, strong) ADTBanner *banner;

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
    [self.banner loadAndShow];
}

- (void)adtBannerDidLoad:(ADTBanner *)adtBanner {
    NSLog(@"广告加载完成");
}

- (void)adtBanner:(ADTBanner *)adtBanner didFailWithError:(NSError *)error {
    NSLog(@"广告加载失败");
}

- (void)adtBannerWillExposure:(ADTBanner *)adtBanner {
    NSLog(@"广告将要展示");
}

- (void)adtBannerDidClick:(ADTBanner *)adtBanner {
    NSLog(@"广告被点击");
}

- (ADTBanner*)banner{
    if(!_banner){
        _banner = [[ADTBanner alloc] initWithBannerType:ADTBannerTypeDefault placementID:@"541"];
        [_banner addLayoutAttribute:ADTBannerLayoutAttributeHorizontally constant:0];
        [_banner addLayoutAttribute:ADTBannerLayoutAttributeVertically constant:0];
        _banner.delegate = self;
        [self.view addSubview:_banner];
    }
    return _banner;
}
@end
