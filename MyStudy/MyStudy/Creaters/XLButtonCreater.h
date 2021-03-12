//
//  XLButtonCreater.h
//  MyStudy
//
//  Created by daiwei62 on 2021/3/11.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XLButtonCreater : NSObject

+ (UIButton *)createJumpButtonWithTitle:(NSString *)title
                                  frame:(CGRect)frame
                                 target:(id)target
                                 action:(SEL)action;

@end

NS_ASSUME_NONNULL_END
