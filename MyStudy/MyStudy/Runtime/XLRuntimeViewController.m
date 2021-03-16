//
//  XLRuntimeViewController.m
//  MyStudy
//
//  Created by daiwei62 on 2021/3/12.
//

#import "XLRuntimeViewController.h"

#import "XLButtonCreater.h"
#import "XLCate.h"

@interface XLRuntimeViewController ()

@end

@implementation XLRuntimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createButtons];
}

- (void)createButtons{
    CGRect frame = CGRectMake(100, 150, 100, 20);
    UIButton *category1Button = [XLButtonCreater createJumpButtonWithTitle:@"分类1" frame:frame target:self action:@selector(category1Action)];
    [self.view addSubview:category1Button];
}

#pragma mark - actions
- (void)category1Action{
    [XLCate see];
    
    XLCate *cate = [[XLCate alloc] init];
    [cate eat];
    [cate run];
    [cate jump];
}

@end
