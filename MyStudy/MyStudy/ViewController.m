//
//  ViewController.m
//  MyStudy
//
//  Created by daiwei62 on 2021/3/11.
//

#import "ViewController.h"
#import "XLAlgorithmViewController.h"

#import "XLButtonCreater.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createButtons];
}

- (void)createButtons{
    CGRect frame = CGRectMake(100, 150, 100, 20);
    UIButton *algorithmButton = [XLButtonCreater createJumpButtonWithTitle:@"算法" frame:frame target:self action:@selector(jumpToAlgorithm)];
    [self.view addSubview:algorithmButton];
}

#pragma mark - actions
- (void)jumpToAlgorithm{
    XLAlgorithmViewController *vc = [[XLAlgorithmViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
