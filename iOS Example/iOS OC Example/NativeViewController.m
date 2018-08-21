//
//  NativeViewController.m
//  iOS OC Example
//
//  Created by 公司 on 2018/6/13.
//

#import "NativeViewController.h"
#import <ADTiming/ADTiming.h>
#import "UIImageView+WebCache.h"

@interface NativeViewController () <ATNativeLoaderDelegate> {
    ATNativeLoader *_nativeLoader;
    ATNativeView* _atNativeView;
    UIView *_adView;
    UIImageView *_mainImageView;
    UIImageView *_iconImageView;
    UILabel *_title;
    UILabel *_description;
}
@property (nonatomic , strong)ATNativeItem *nativeItem;

@end

@implementation NativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ATNativeLoader *loader = [[ATNativeLoader alloc] init];
    loader.placementId = @"109";
    loader.delegate = self;
    loader.adType = ATNativeTypeNormal;
    loader.rootViewController = self;
    _nativeLoader = loader;
}

- (void)loadData{
    [_mainImageView sd_setImageWithURL:[NSURL URLWithString:_nativeItem.imageUrl]];
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:_nativeItem.iconUrl]];
    
    _title.text = _nativeItem.title;
    _description.text = _nativeItem.body;;
}

- (void)setAdView{
    if (!_adView) {
        _adView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
        _adView.clipsToBounds = YES;
    }
    
    if (!_mainImageView) {
        _mainImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
        [_adView addSubview:_mainImageView];
    }
    
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        [_adView addSubview:_iconImageView];
    }
    
    if(!_title){
        _title = [[UILabel alloc] initWithFrame:CGRectMake(0, 270, self.view.frame.size.width, 15)];
        [_adView addSubview:_title];
    }
    
    if (!_description) {
        _description = [[UILabel alloc] initWithFrame:CGRectMake(0, 285, self.view.frame.size.width, 15)];
        [_adView addSubview:_description];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)load:(id)sender {
    [_nativeLoader load];
}

- (IBAction)show:(id)sender {
    [_atNativeView removeFromSuperview];
    _atNativeView  = nil;
    [self setAdView];
    [self loadData];
    if (_nativeItem) {
        _atNativeView = [[ATNativeView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 300)];
        [_atNativeView updateWithItem:_nativeItem];
        [_atNativeView addAd:_adView];
        [self.view addSubview:_atNativeView];
        [_nativeLoader attach:_atNativeView];
    }
}

- (void)atNativeDidLoad:(ATNativeLoader *)native item:(ATNativeItem *)item {
    _nativeItem = item;
    NSLog(@"nativeAdDidLoad");
}

- (void)atNative:(ATNativeLoader *)native failWithError:(NSError *)error {
    NSLog(@"nativeAddidFail");
}

- (void)atNativeWillExposure:(ATNativeLoader *)native {
    NSLog(@"nativeAdWillExposure");
}

- (void)atNativeDidClick:(ATNativeLoader *)native {
    NSLog(@"nativeAdDidClick");
}

@end
