//
//  XLBaseViewController.h
//  MyStudy
//
//  Created by daiwei62 on 2021/3/16.
//

#import <UIKit/UIKit.h>

#define SCREEN_WIDTH                    CGRectGetWidth([[UIScreen mainScreen] bounds])
#define kIphone6Scale(x)                ((x)*SCREEN_WIDTH/375.0f)

NS_ASSUME_NONNULL_BEGIN

@interface XLBaseViewController : UIViewController

@end

NS_ASSUME_NONNULL_END
