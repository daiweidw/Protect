//
//  XLMouseTestPosion.m
//  MyStudy
//
//  Created by daiwei62 on 2021/3/11.
//

#import "XLMouseTestPosion.h"

@implementation XLMouseTestPosion

+ (void)action{
    NSUInteger mouseNum = 4;
    NSMutableArray *mouseLifeState = [NSMutableArray array];
    for (int i=0; i<mouseNum; i++) {
        NSInteger tmpLife = arc4random()%2;
        [mouseLifeState addObject:[NSNumber numberWithInteger:tmpLife]];
    }
    
    NSLog(@"老鼠中毒状态 %@", [mouseLifeState componentsJoinedByString:@" "]);
    
    int positionNum = 0;
    for (int i=0; i<mouseNum; i++) {
        NSInteger tmpState = [mouseLifeState[i] integerValue];
        positionNum |= (tmpState << (mouseNum - i - 1) );
    }
    
    NSLog(@"有毒的瓶子是 %d", positionNum);
}

@end
