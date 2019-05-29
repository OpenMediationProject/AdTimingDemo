//
//  ViewController.m
//  iOS OC Example
//
//  Created by M on 2019/5/28.
//  Copyright © 2019 1tu1shu. All rights reserved.
//

#import "ViewController.h"
#import "BannerViewController.h"
#import "NativeViewController.h"
#import "VideoViewController.h"
#import "InterstitialViewController.h"
#import "InteractiveViewController.h"
#import "Macro.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong)UITableView *mainTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createViews];
}

-(void)createViews
{
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, KNavHeight, kScreenWidth, kScreenHeight-KNavHeight) style:UITableViewStylePlain];
    _mainTableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_mainTableView];
    _mainTableView.rowHeight = 50;
    //    _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _mainTableView.tableFooterView = [[UIView alloc] init];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Banner";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"Native";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"Interstitial";
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"Video";
    }else if (indexPath.row == 4){
        cell.textLabel.text = @"Interactive";
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BannerViewController *bannerVC = [[BannerViewController alloc] init];
    NativeViewController *nativeVC = [[NativeViewController alloc] init];
    InterstitialViewController *intetVC = [[InterstitialViewController alloc] init];
    VideoViewController *videoVC = [[VideoViewController alloc] init];
    InteractiveViewController *interactiveVC = [[InteractiveViewController alloc] init];
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:bannerVC animated:YES];
    }else if (indexPath.row == 1) {
        [self.navigationController pushViewController:nativeVC animated:YES];
    }else if (indexPath.row == 2) {
        [self.navigationController pushViewController:intetVC animated:YES];
    }else if (indexPath.row == 3) {
        [self.navigationController pushViewController:videoVC animated:YES];
    }else if (indexPath.row == 4) {
        [self.navigationController pushViewController:interactiveVC animated:YES];
    }
}


@end
