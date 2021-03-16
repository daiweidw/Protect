//
//  XLLayoutViewController.m
//  MyStudy
//
//  Created by daiwei62 on 2021/3/16.
//

#import "XLLayoutViewController.h"
#import "XLFrameBoundsViewController.h"

#import "XLButtonCreater.h"

@interface XLLayoutViewController ()

@end

@implementation XLLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createButtons];
}

- (void)createButtons{
    CGRect frame = CGRectMake(100, 150, 100, 20);
    UIButton *frameBoundsButton = [XLButtonCreater createJumpButtonWithTitle:@"size" frame:frame target:self action:@selector(goToFrameBounds)];
    [self.view addSubview:frameBoundsButton];
}

#pragma mark - actions
- (void)goToFrameBounds{
    XLFrameBoundsViewController *vc = [[XLFrameBoundsViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
