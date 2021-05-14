//
//  XLCollectionViewLayout.h
//  MyStudy
//
//  Created by daiwei62 on 2021/5/11.
//

#import <UIKit/UIKit.h>

@protocol XLCollectionViewLayoutDelegate <NSObject>

@required
- (CGFloat)heightForItemAtIndexPath:(NSIndexPath *)indexPath withWidth:(CGFloat)width;

@optional
- (NSInteger)numberOfColumnInSection:(NSInteger)section;
- (CGFloat)heightForHeaderViewInSection:(NSInteger)section;
- (UIEdgeInsets)edgeInsetsInSection:(NSInteger)section;
- (CGFloat)spaceOfColumnInSection:(NSInteger)section;
- (CGFloat)spaceOfRowInSection:(NSInteger)section;
- (CGFloat)heightForFooterViewInSection:(NSInteger)section;
- (BOOL)headerHockInSection:(NSInteger)section;

@end

@interface XLCollectionViewLayout : UICollectionViewLayout

@property (nonatomic, weak) id<XLCollectionViewLayoutDelegate> xldelegate;

@end
