//
//  XLCollectionGreenSection.m
//  MyStudy
//
//  Created by daiwei62 on 2021/5/13.
//

#import "XLCollectionGreenSection.h"
#import "XLCollectionViewCell.h"
#import "UICollectionGreenHeaderView.h"

@implementation XLCollectionGreenSection

- (NSInteger)numberOfItemsInsection{
    return 20;
}

- (CGFloat)heightForItemInsection:(NSInteger)item withWidth:(CGFloat)width{
    NSInteger y = item%2;
    if (y > 0) {
        return 80;
    }
    return 60;
}

- (NSString *)cellNameForRigisterInsection{
    return @"XLCollectionViewCell";
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XLCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"XLCollectionViewCell" forIndexPath:indexPath];
    [cell updateTitle:[NSString stringWithFormat:@"%ld-%ld", (long)indexPath.section, (long)indexPath.item]];
    cell.backgroundColor = [UIColor greenColor];
    return cell;
}

- (NSInteger)numberOfColumnInsection{
    return 2;
}

- (CGFloat)heightForHeaderViewInsection{
    return 60;
}

- (UIEdgeInsets)edgeInsetsInsection{
    return UIEdgeInsetsMake(5, 10, 0, 10);
}

- (CGFloat)spaceOfColumnInsection{
    return 10;
}

- (CGFloat)spaceOfRowInsection{
    return 10;
}

- (CGFloat)heightForFooterViewInsection{
    return 0;
}

- (NSString *)reusableHeaderViewNameForRigisterInsection{
    return @"UICollectionGreenHeaderView";
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader){
        UICollectionGreenHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"UICollectionGreenHeaderView" forIndexPath:indexPath];
        [headerView updateTitle:@"这个一个绿色的开头"];
        headerView.backgroundColor = [UIColor greenColor];
        return headerView;
    }
    return nil;
}

- (BOOL)headerHockInSection{
    return YES;
}

@end
