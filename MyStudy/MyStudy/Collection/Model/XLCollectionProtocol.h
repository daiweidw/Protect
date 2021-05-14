//
//  XLCollectionProtocol.h
//  MyStudy
//
//  Created by daiwei62 on 2021/5/13.
//

#ifndef XLCollectionProtocol_h
#define XLCollectionProtocol_h

#import <UIKit/UIKit.h>

@protocol XLCollectionSectionDelegate <NSObject>

@required
- (NSInteger)numberOfItemsInsection;
- (CGFloat)heightForItemInsection:(NSInteger)item withWidth:(CGFloat)width;
- (NSString *)cellNameForRigisterInsection;
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

@optional
- (NSInteger)numberOfColumnInsection;
- (CGFloat)heightForHeaderViewInsection;
- (UIEdgeInsets)edgeInsetsInsection;
- (CGFloat)spaceOfColumnInsection;
- (CGFloat)spaceOfRowInsection;
- (CGFloat)heightForFooterViewInsection;

@end


#endif /* XLCollectionProtocol_h */
