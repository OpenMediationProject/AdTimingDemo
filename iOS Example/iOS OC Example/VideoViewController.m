//
//  VideoViewController.m
//  iOS OC Example
//
//  Created by 公司 on 2018/6/13.
//

#import "VideoViewController.h"

@import AdTiming;
@interface VideoViewController () <ADTVideoAdDelegate>

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)load:(id)sender {
    [ADTVideoAd sharedInstance].delegate = self;
    [[ADTVideoAd sharedInstance]loadWithPlacmentID:@"113"];
}

- (IBAction)show:(id)sender {
    [[ADTVideoAd sharedInstance] isReady:@"113"];
    [[ADTVideoAd sharedInstance]show:@"113"];
}

- (void)ADTVideoAdDidload:(NSString*)placementID{
    NSLog(@"广告加载成功");
}

- (void)ADTVideoAdDidFailToLoad:(NSError*)error{
    NSLog(@"广告加载成功");
}

- (void)ADTVideoAdDidStart{
    NSLog(@"广告开始播放");
}

- (void)ADTVideoAdDidClick{
    NSLog(@"点击广告");
}

- (void)ADTVideoAdDidFinish:(ADTVideoAdFinishState)state{
    if(state == ADTVideoAdFinishStateSkipped){
        NSLog(@"广告播放完成(跳过)");
    } else if (state == ADTVideoAdFinishStateCompleted){
        NSLog(@"广告播放完成(完整)");
    }
}

@end
