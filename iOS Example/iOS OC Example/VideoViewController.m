//
//  VideoViewController.m
//  iOS OC Example
//
//  Created by 公司 on 2018/6/13.
//

#import "VideoViewController.h"
#import <ADTiming/ADTiming.h>

@interface VideoViewController () <ATVideoDelegate>

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[ATVideo shared] setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)load:(id)sender {
    [[ATVideo shared] load:@"113"];
}

- (IBAction)show:(id)sender {
    // [[ATVideo shared] isReady:@"113"];
    [[ATVideo shared] present:self placementId:@"113"];
}

- (void)atVideoDidLoad:(ATVideo *)video placementId:(NSString *)placementId {
    NSLog(@"videoAdDidLoad");
}

- (void)atVideo:(ATVideo *)video placementId:(NSString *)placementId failWithShow:(NSError *)error {
    NSLog(@"videoAdShowFail");
}

- (void)atVideoStartPlay:(ATVideo *)video placementId:(NSString *)placementId {
    NSLog(@"videoAdStartPlay");
}

- (void)atVideoDidClick:(ATVideo *)video placementId:(NSString *)placementId {
    NSLog(@"videoAdDidClick");
}

- (void)atVideoFinishPlay:(ATVideo *)video placementId:(NSString *)placementId finishState:(enum ATVideoFinishState)finishState {
    if (finishState == ATVideoFinishStateSkipped) {
        NSLog(@"VideoAdSkip");
    } else if (finishState == ATVideoFinishStateCompleted) {
        NSLog(@"VideoAdCompleted");
    }
}

- (void)atVideoDidClose:(ATVideo *)video placementId:(NSString *)placementId {
    NSLog(@"VideoAdDidClose");
}

@end
