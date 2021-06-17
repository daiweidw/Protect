//
//  NSString+XLLabel.m
//  MyStudy
//
//  Created by daiwei62 on 2021/6/16.
//

#import "NSString+XLLabel.h"

@implementation NSString (XLLabel)

- (NSArray *)xl_getLinesArrayOfStringWidth:(CGFloat)width attributes:(NSDictionary *)attributes{
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:self attributes:attributes];
    
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attStr);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0,0,width,100000));
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    NSArray *lines = ( NSArray *)CTFrameGetLines(frame);
    NSMutableArray *linesArray = [[NSMutableArray alloc]init];
    for (id line in lines) {
        CTLineRef lineRef = (__bridge  CTLineRef )line;
        CFRange lineRange = CTLineGetStringRange(lineRef);
        NSRange range = NSMakeRange(lineRange.location, lineRange.length);
        NSString *lineString = [self substringWithRange:range];
        CFAttributedStringSetAttribute((CFMutableAttributedStringRef)attStr,
                                       lineRange,
                                       kCTKernAttributeName,
                                       (CFTypeRef)([NSNumber numberWithFloat:0.0]));
        CFAttributedStringSetAttribute((CFMutableAttributedStringRef)attStr,
                                       lineRange,
                                       kCTKernAttributeName,
                                       (CFTypeRef)([NSNumber numberWithInt:0.0]));
        [linesArray addObject:lineString];
    }
    CGPathRelease(path);
    CFRelease(frame);
    CFRelease(frameSetter);
    return (NSArray *)linesArray;
}

- (CGSize)xl_sizeWithAttributes:(NSDictionary *)attributes constraintSize:(CGSize)constraintSize attchstring:(NSAttributedString *)attchstring{
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:self];
    if (attchstring) {
        [attStr appendAttributedString:[[NSAttributedString alloc] initWithString:@"  "]];
        [attStr appendAttributedString:attchstring];
    }
    [attStr setAttributes:attributes range:NSMakeRange(0, attStr.length)];

    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attStr);
    CFRange fitRange;

    CFRange textRange = CFRangeMake(0, attStr.length);
    CGSize frameSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, textRange, NULL, constraintSize, &fitRange);

    CFRelease(framesetter);
    
    return frameSize;

}

@end
