//
//  XLCollectionSectionModel.m
//  MyStudy
//
//  Created by daiwei62 on 2021/5/12.
//

#import "XLCollectionSectionModel.h"


@interface XLCollectionSectionModel ()

@end

@implementation XLCollectionSectionModel

- (NSInteger)numberOfItemsInsection{
    return 0;
}

- (CGFloat)heightForItemInsection:(NSInteger)item withWidth:(CGFloat)width{
    return 0;
}

- (NSString *)cellNameForRigisterInsection{
    return @"UICollectionViewCell";
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    return cell;
}

- (NSInteger)numberOfColumnInsection{
    return 2;
}

- (CGFloat)heightForHeaderViewInsection{
    return 0;
}

- (UIEdgeInsets)edgeInsetsInsection{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)spaceOfColumnInsection{
    return 0;
}

- (CGFloat)spaceOfRowInsection{
    return 0;
}

- (CGFloat)heightForFooterViewInsection{
    return 0;
}

- (BOOL)headerHockInSection{
    return NO;
}

@end
