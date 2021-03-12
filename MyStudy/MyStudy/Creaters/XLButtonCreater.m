//
//  XLButtonCreater.m
//  MyStudy
//
//  Created by daiwei62 on 2021/3/11.
//

#import "XLButtonCreater.h"

@implementation XLButtonCreater

+ (UIButton *)createJumpButtonWithTitle:(NSString *)title
                                  frame:(CGRect)frame
                                 target:(id)target
                                 action:(SEL)action{
    UIButton *jumpBtn = [[UIButton alloc] initWithFrame:frame];
    [jumpBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [jumpBtn setTitle:(title?:@"") forState:UIControlStateNormal];
    [jumpBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    jumpBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    jumpBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    return jumpBtn;
}

@end
