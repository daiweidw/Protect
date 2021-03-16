//
//  XLFrameBoundsViewController.m
//  MyStudy
//
//  Created by daiwei62 on 2021/3/16.
//

#import "XLFrameBoundsViewController.h"
#import "XLButtonCreater.h"

@interface XLFrameBoundsViewController ()

@property (nonatomic, strong) UIView *viewFA;
@property (nonatomic, strong) UIView *viewSA;

@end

@implementation XLFrameBoundsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createButtons];
}

- (void)createButtons{
    CGFloat tmpx = 10;
    CGRect frame = CGRectMake(tmpx, 100, 20, 20);
    UIButton *actionAButton = [XLButtonCreater createJumpButtonWithTitle:@"f1" frame:frame target:self action:@selector(actionA)];
    [self.view addSubview:actionAButton];
    
    tmpx += 20;
    frame = CGRectMake(tmpx, 100, 20, 20);
    UIButton *actionBButton = [XLButtonCreater createJumpButtonWithTitle:@"f2" frame:frame target:self action:@selector(actionB)];
    [self.view addSubview:actionBButton];
}

#pragma mark - actions
- (void)actionA{
    [self removeAllSubviews];
    [self loadViewA];
    
    _viewSA.bounds = CGRectMake(_viewSA.bounds.origin.x, _viewSA.bounds.origin.y, 20, 20);
    NSLog(@"actionA : %f %f", _viewSA.frame.size.width, _viewSA.bounds.size.width);
}

- (void)actionB{
    [self removeAllSubviews];
    [self loadViewA];
    
    _viewFA.bounds = CGRectMake(10, 10, _viewFA.bounds.size.width, _viewFA.bounds.size.height);
    NSLog(@"actionB : %f %f", _viewSA.frame.origin.x, _viewSA.frame.origin.y);
}

#pragma mark - load
- (void)loadViewA{
    _viewFA = [[UIView alloc] initWithFrame:CGRectMake(0, 150, 200, 150)];
    _viewFA.backgroundColor = [UIColor redColor];
    [self.view addSubview:_viewFA];
    
    _viewSA = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 100, 80)];
    _viewSA.backgroundColor = [UIColor blueColor];
    [_viewFA addSubview:_viewSA];
}

#pragma mark - private
- (void)removeAllSubviews{
    for (id tmpV in [self.view subviews]) {
        if ([tmpV isKindOfClass:[UIButton class]]) {
            continue;
        }
        [tmpV removeFromSuperview];
    }
}

@end
