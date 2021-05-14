//
//  XLCollectionViewLayout.m
//  MyStudy
//
//  Created by daiwei62 on 2021/5/11.
//

#import "XLCollectionViewLayout.h"

@interface XLCollectionViewLayout ()

@property (nonatomic, strong) NSMutableArray *attributesArray;
@property (nonatomic, strong) NSMutableArray *columnHeights;
@property (nonatomic, assign) CGFloat contentHeight;

@end

@implementation XLCollectionViewLayout

- (void)prepareLayout{
    [super prepareLayout];
    
    self.contentHeight = 0;
    [self.attributesArray removeAllObjects];
    
    NSInteger sections = [self.collectionView numberOfSections];
    for (NSInteger i=0; i<sections; i++) {
        [self.columnHeights removeAllObjects];
        
        NSInteger columnInsection = [self numberOfColumnInSection:i];
        CGFloat headerInsection = [self heightForHeaderViewInSection:i];
        UIEdgeInsets edgeInsetInsection = [self edgeInsetsInSection:i];
        
        headerInsection = headerInsection>0?headerInsection:0;
        
        for (NSInteger c=0; c<columnInsection; c++) {
            [self.columnHeights addObject:@(self.contentHeight + headerInsection + edgeInsetInsection.top)];
        }
        
        if (headerInsection > 0) {
            UICollectionViewLayoutAttributes *headerAttrs = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader withIndexPath:[NSIndexPath indexPathWithIndex:i]];
            headerAttrs.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, headerInsection);
            [self.attributesArray addObject:headerAttrs];
        }
        
        NSInteger itemInsection = [self.collectionView numberOfItemsInSection:i];
        for (NSInteger item=0; item<itemInsection; item++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:i];
            UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
            [self.attributesArray addObject:attrs];
        }
        
        CGFloat footerInsection = [self heightForFooterViewInSection:i];
        footerInsection = footerInsection>0?footerInsection:0;
        if (footerInsection > 0) {
            UICollectionViewLayoutAttributes *footerAttrs = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter withIndexPath:[NSIndexPath indexPathWithIndex:i]];
            footerAttrs.frame = CGRectMake(0, self.contentHeight + edgeInsetInsection.bottom, [[UIScreen mainScreen] bounds].size.width, footerInsection);
            [self.attributesArray addObject:footerAttrs];
        }
        self.contentHeight = self.contentHeight + edgeInsetInsection.bottom + footerInsection;
    }
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.attributesArray;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    NSInteger cellSection = indexPath.section;
    NSInteger columnInsection = [self numberOfColumnInSection:cellSection];
    UIEdgeInsets edgeInsetInsection = [self edgeInsetsInSection:cellSection];
    CGFloat columnSpace = [self spaceOfColumnInSection:cellSection];
    CGFloat rowSpace = [self spaceOfRowInSection:cellSection];
    
    CGFloat collectionViewW = self.collectionView.frame.size.width;
    CGFloat w = (collectionViewW - edgeInsetInsection.left - edgeInsetInsection.right - (columnInsection - 1) * columnSpace) / columnInsection;
    CGFloat h = [self heightForItemAtIndexPath:indexPath withWidth:w];
    
    //加载高度最短的下面
    NSInteger destColumn = 0;
    CGFloat minColumnHeight = [self.columnHeights[0] doubleValue];
    for (NSInteger i = 1; i < columnInsection; i++) {
        // 取得第i列的高度
        CGFloat columnHeight = [self.columnHeights[i] doubleValue];
        
        if (minColumnHeight > columnHeight) {
            minColumnHeight = columnHeight;
            destColumn = i;
        }
    }
    
    CGFloat x = edgeInsetInsection.left + destColumn * (w + columnSpace);
    CGFloat y = minColumnHeight;
    if (y != edgeInsetInsection.top) {
        y += rowSpace;
    }
    attrs.frame = CGRectMake(x, y, w, h);
    
    //更新最短那列的高度
    self.columnHeights[destColumn] = @(CGRectGetMaxY(attrs.frame));
    
    //记录内容的高度
    CGFloat columnHeight = [self.columnHeights[destColumn] doubleValue];
    
    //找出最高的高度
    if (self.contentHeight < columnHeight) {
        self.contentHeight = columnHeight;
    }
    
    return attrs;
}

- (CGSize)collectionViewContentSize
{
    return CGSizeMake(0, self.contentHeight);
}

#pragma mark -
- (NSInteger)numberOfColumnInSection:(NSInteger)section{
    if (self.xldelegate && [self.xldelegate respondsToSelector:@selector(numberOfColumnInSection:)]) {
        return [self.xldelegate numberOfColumnInSection:section];
    }
    return 2;
}

- (CGFloat)heightForHeaderViewInSection:(NSInteger)section{
    if (self.xldelegate && [self.xldelegate respondsToSelector:@selector(heightForHeaderViewInSection:)]) {
        return [self.xldelegate heightForHeaderViewInSection:section];
    }
    return 0;
}

- (UIEdgeInsets)edgeInsetsInSection:(NSInteger)section{
    if (self.xldelegate && [self.xldelegate respondsToSelector:@selector(edgeInsetsInSection:)]) {
        return [self.xldelegate edgeInsetsInSection:section];
    }
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)spaceOfColumnInSection:(NSInteger)section{
    if (self.xldelegate && [self.xldelegate respondsToSelector:@selector(spaceOfColumnInSection:)]) {
        return [self.xldelegate spaceOfColumnInSection:section];
    }
    return 0;
}

- (CGFloat)spaceOfRowInSection:(NSInteger)section{
    if (self.xldelegate && [self.xldelegate respondsToSelector:@selector(spaceOfRowInSection:)]) {
        return [self.xldelegate spaceOfRowInSection:section];
    }
    return 0;
}

- (CGFloat)heightForItemAtIndexPath:(NSIndexPath *)indexPath withWidth:(CGFloat)width{
    if (self.xldelegate && [self.xldelegate respondsToSelector:@selector(heightForItemAtIndexPath:withWidth:)]) {
        return [self.xldelegate heightForItemAtIndexPath:indexPath withWidth:width];
    }
    return 0;
}

- (CGFloat)heightForFooterViewInSection:(NSInteger)section{
    if (self.xldelegate && [self.xldelegate respondsToSelector:@selector(heightForFooterViewInSection:)]) {
        return [self.xldelegate heightForFooterViewInSection:section];
    }
    return 0;
}

#pragma mark -
- (NSMutableArray *)attributesArray{
    if (!_attributesArray) {
        _attributesArray = [NSMutableArray array];
    }
    return _attributesArray;
}

- (NSMutableArray *)columnHeights{
    if (!_columnHeights) {
        _columnHeights = [NSMutableArray array];
    }
    return _columnHeights;
}

@end
