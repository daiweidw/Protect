//
//  ViewController.m
//  MyStudy
//
//  Created by daiwei62 on 2021/3/11.
//

#import "ViewController.h"
#import "XLAlgorithmViewController.h"
#import "XLRuntimeViewController.h"
#import "XLLayoutViewController.h"
#import "XLCollectionViewController.h"

#import "XLButtonCreater.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createButtons];
}

- (void)createButtons{
    CGFloat y = 150;
    
    CGRect frame = CGRectMake(100, y, 100, 20);
    UIButton *algorithmButton = [XLButtonCreater createJumpButtonWithTitle:@"算法" frame:frame target:self action:@selector(jumpToAlgorithm)];
    [self.view addSubview:algorithmButton];
    
    y += 40;
    
    frame = CGRectMake(100, y, 100, 20);
    UIButton *runtimeButton = [XLButtonCreater createJumpButtonWithTitle:@"运行时" frame:frame target:self action:@selector(jumpToRuntime)];
    [self.view addSubview:runtimeButton];
    
    y += 40;
    
    frame = CGRectMake(100, y, 100, 20);
    UIButton *layoutButton = [XLButtonCreater createJumpButtonWithTitle:@"布局" frame:frame target:self action:@selector(jumpToLayout)];
    [self.view addSubview:layoutButton];
    
    y += 40;
    
    frame = CGRectMake(100, y, 100, 20);
    UIButton *flowButton = [XLButtonCreater createJumpButtonWithTitle:@"瀑布流" frame:frame target:self action:@selector(jumpToFlow)];
    [self.view addSubview:flowButton];
}

#pragma mark - actions
- (void)jumpToAlgorithm{
    XLAlgorithmViewController *vc = [[XLAlgorithmViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)jumpToRuntime{
    XLRuntimeViewController *vc = [[XLRuntimeViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)jumpToLayout{
    XLLayoutViewController *vc = [[XLLayoutViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)jumpToFlow{
    XLCollectionViewController *vc = [[XLCollectionViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
