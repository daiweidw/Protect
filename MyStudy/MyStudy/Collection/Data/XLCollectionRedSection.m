//
//  XLCollectionRedSection.m
//  MyStudy
//
//  Created by daiwei62 on 2021/5/13.
//

#import "XLCollectionRedSection.h"
#import "XLCollectionViewCell.h"

@implementation XLCollectionRedSection

- (NSInteger)numberOfItemsInsection{
    return 10;
}

- (CGFloat)heightForItemInsection:(NSInteger)item withWidth:(CGFloat)width{
    return 40;
}

- (NSString *)cellNameForRigisterInsection{
    return @"XLCollectionViewCell";
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XLCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"XLCollectionViewCell" forIndexPath:indexPath];
    [cell updateTitle:[NSString stringWithFormat:@"%ld-%ld", (long)indexPath.section, (long)indexPath.item]];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (NSInteger)numberOfColumnInsection{
    return 1;
}

- (CGFloat)heightForHeaderViewInsection{
    return 0;
}

- (UIEdgeInsets)edgeInsetsInsection{
    return UIEdgeInsetsMake(0, 15, 0, 15);
}

- (CGFloat)spaceOfColumnInsection{
    return 0;
}

- (CGFloat)spaceOfRowInsection{
    return 15;
}

- (CGFloat)heightForFooterViewInsection{
    return 0;
}

@end
