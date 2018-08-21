//
//  ViewController.m
//  iOS OC Example
//
//  Created by 公司 on 2018/6/13.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate> {
    NSArray *_dataArray;
}
@property (weak, nonatomic) IBOutlet UITableView *OCtableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArray = @[@"Native",
                   @"Banner",
                   @"Video",
                   @"Interstitial"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"item" forIndexPath:indexPath];
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
            [self performSegueWithIdentifier:@"native" sender:nil];
            break;
        case 1:
            [self performSegueWithIdentifier:@"banner" sender:nil];
            break;
        case 2:
            [self performSegueWithIdentifier:@"video" sender:nil];
            break;
        case 3:
            [self performSegueWithIdentifier:@"interstitial" sender:nil];
            break;
        default:
            break;
    }
}

@end
