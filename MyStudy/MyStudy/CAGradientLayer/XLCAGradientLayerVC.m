//
//  XLCAGradientLayerVC.m
//  MyStudy
//
//  Created by daiwei62 on 2021/6/10.
//

#import "XLCAGradientLayerVC.h"

@interface XLCAGradientLayerVC ()

@end

@implementation XLCAGradientLayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadCAGradientLayerView];
}

- (void)loadCAGradientLayerView{
    UIView *containGradientView = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 34, 13)];
    [self.view addSubview:containGradientView];
    
    CAGradientLayer *tmpgl = [CAGradientLayer layer];
    tmpgl.frame = CGRectMake(0, 0, 34, 13);
    tmpgl.startPoint = CGPointMake(0.09,0.5);
    tmpgl.endPoint = CGPointMake(0.54,0.5);
    tmpgl.colors = @[(__bridge id)[UIColor colorWithRed:246/255.0 green:253/255.0 blue:250/255.0 alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:247/255.0 green:253/255.0 blue:250/255.0 alpha:1].CGColor];
    tmpgl.locations = @[@(0), @(1.0f)];
    [containGradientView.layer addSublayer:tmpgl];
}

@end
