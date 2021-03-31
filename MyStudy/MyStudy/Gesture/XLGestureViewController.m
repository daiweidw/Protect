//
//  XLGestureViewController.m
//  MyStudy
//
//  Created by daiwei62 on 2021/3/16.
//

#import "XLGestureViewController.h"

#import "XLButtonCreater.h"

@interface XLGestureViewController ()

@end

@implementation XLGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createButtons];
}

- (void)createButtons{
    CGRect frame = CGRectMake(100, 150, 100, 20);
    UIButton *tabButton = [XLButtonCreater createJumpButtonWithTitle:@"tap" frame:frame target:self action:@selector(buttonAction)];
    [self.view addSubview:tabButton];
}

- (void)buttonAction{
    
}

- (void)tapAction{
    
}

@end
