//
//  XLCollectionGraySection.m
//  MyStudy
//
//  Created by daiwei62 on 2021/5/13.
//

#import "XLCollectionGraySection.h"
#import "XLCollectionViewCell.h"

@implementation XLCollectionGraySection

- (NSInteger)numberOfItemsInsection{
    return 30;
}

- (CGFloat)heightForItemInsection:(NSInteger)item withWidth:(CGFloat)width{
    return 80;
}

- (NSString *)cellNameForRigisterInsection{
    return @"XLCollectionViewCell";
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XLCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"XLCollectionViewCell" forIndexPath:indexPath];
    [cell updateTitle:[NSString stringWithFormat:@"%ld-%ld", (long)indexPath.section, (long)indexPath.item]];
    cell.backgroundColor = [UIColor grayColor];
    return cell;
}

- (NSInteger)numberOfColumnInsection{
    return 3;
}

- (CGFloat)heightForHeaderViewInsection{
    return 0;
}

- (UIEdgeInsets)edgeInsetsInsection{
    return UIEdgeInsetsMake(0, 5, 0, 5);
}

- (CGFloat)spaceOfColumnInsection{
    return 5;
}

- (CGFloat)spaceOfRowInsection{
    return 5;
}

- (CGFloat)heightForFooterViewInsection{
    return 0;
}

@end
