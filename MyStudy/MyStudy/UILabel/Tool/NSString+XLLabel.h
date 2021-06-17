//
//  NSString+XLLabel.h
//  MyStudy
//
//  Created by daiwei62 on 2021/6/16.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

@interface NSString (XLLabel)

- (NSArray *)xl_getLinesArrayOfStringWidth:(CGFloat)width attributes:(NSDictionary *)attributes;

- (CGSize)xl_sizeWithAttributes:(NSDictionary *)attributes constraintSize:(CGSize)constraintSize attchstring:(NSAttributedString *)attchstring;

@end
