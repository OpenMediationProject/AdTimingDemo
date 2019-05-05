//
//  NativeViewController.m
//  iOS OC Example
//
//  Created by 公司 on 2018/6/13.
//

#import "NativeViewController.h"
#import "UIImageView+WebCache.h"

@import AdTiming;

@interface NativeViewController () <ADTNativeDelegate>
@property (nonatomic, strong) NSString *loadId;
@property (nonatomic, strong) ADTNative *native;
@property (nonatomic, strong) ADTNativeAd *nativeAd;
@property (nonatomic, strong) ADTNativeView *nativeView;
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *bodyLabel;

@end

@implementation NativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.nativeView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)load:(id)sender {
    self.native = [[ADTNative alloc]initWithPlacmentID:@"109"];
    self.native.delegate = self;
    [self.native loadAd];
}

- (IBAction)show:(id)sender {
    self.nativeView.hidden = NO;
    self.nativeView.nativeAd = self.nativeAd;
    _iconView.image =[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.nativeAd.iconUrl]]];
    _titleLabel.text = self.nativeAd.title;
    _bodyLabel.text = self.nativeAd.body;
}

- (void)ADTNativeDidload:(ADTNativeAd*)nativeAd{
    _nativeAd = nativeAd;
    NSLog(@"广告加载成功");
}

- (ADTNativeView*)nativeView{
    if(!_nativeView){
        _nativeView = [[ADTNativeView alloc]initWithFrame:CGRectMake(0,300, self.view.frame.size.width, 300)];
        _nativeView.mediaView = [[ADTNativeMediaView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 300)];
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

- (void)ADTNativeDidFailToLoad:(NSError*)error{
    NSLog(@"广告加载失败");
}

- (void)ADTNativeWillShow{
    NSLog(@"广告即将展示");
}

- (void)ADTNativeDidClick{
    NSLog(@"点击广告");
}

@end
