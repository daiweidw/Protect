//
//  XLAlgorithmViewController.m
//  MyStudy
//
//  Created by daiwei62 on 2021/3/11.
//

#import "XLAlgorithmViewController.h"

#import "XLButtonCreater.h"
#import "XLMouseTestPosion.h"

@interface XLAlgorithmViewController ()

@end

@implementation XLAlgorithmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createButtons];
}

- (void)createButtons{
    CGRect frame = CGRectMake(100, 150, 100, 20);
    UIButton *mouseTestPosionButton = [XLButtonCreater createJumpButtonWithTitle:@"老鼠试毒" frame:frame target:self action:@selector(mouseTestPosion)];
    [self.view addSubview:mouseTestPosionButton];
}

#pragma mark - actions
- (void)mouseTestPosion{
    [XLMouseTestPosion action];
}

@end
