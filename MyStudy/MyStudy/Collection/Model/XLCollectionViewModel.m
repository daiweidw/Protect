//
//  XLCollectionViewModel.m
//  MyStudy
//
//  Created by daiwei62 on 2021/5/12.
//

#import "XLCollectionViewModel.h"

@interface XLCollectionViewModel ()

@property (nonatomic, strong, readwrite) UICollectionView *collectionView;

@end

@implementation XLCollectionViewModel

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        XLCollectionViewLayout *layout = [[XLCollectionViewLayout alloc] init];
        layout.xldelegate = self;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    }
    return _collectionView;
}

- (void)setSectionModels:(NSArray<id<XLCollectionSectionDelegate>> *)sectionModels{
    _sectionModels = [NSArray arrayWithArray:sectionModels];
    [self registerCellName];
    [self.collectionView reloadData];
}

- (void)registerCellName{
    for (id<XLCollectionSectionDelegate> tmpModel in self.sectionModels) {
        if (![tmpModel respondsToSelector:@selector(cellNameForRigisterInsection)]) {
            continue;
        }
        NSString *tmpName = [tmpModel cellNameForRigisterInsection];
        if (tmpName.length <= 0) {
            continue;
        }
        [self.collectionView registerClass:NSClassFromString(tmpName) forCellWithReuseIdentifier:tmpName];
    }
}

#pragma mark - XLCollectionViewLayoutDelegate
- (CGFloat)heightForItemAtIndexPath:(NSIndexPath *)indexPath withWidth:(CGFloat)width{
    if (indexPath.section >= self.sectionModels.count) {
        return 0;
    }
    
    id<XLCollectionSectionDelegate> tmpSectionM = self.sectionModels[indexPath.section];
    if ([tmpSectionM respondsToSelector:@selector(heightForItemInsection:withWidth:)]) {
        return [tmpSectionM heightForItemInsection:indexPath.row withWidth:width];
    }
    
    return 0;
}

- (NSInteger)numberOfColumnInSection:(NSInteger)section{
    if (section >= self.sectionModels.count) {
        return 2;
    }
    
    id<XLCollectionSectionDelegate> tmpSectionM = self.sectionModels[section];
    if ([tmpSectionM respondsToSelector:@selector(numberOfColumnInsection)]) {
        return [tmpSectionM numberOfColumnInsection];
    }
    
    return 2;
}

- (CGFloat)spaceOfColumnInSection:(NSInteger)section{
    if (section >= self.sectionModels.count) {
        return 0;
    }
    
    id<XLCollectionSectionDelegate> tmpSectionM = self.sectionModels[section];
    if ([tmpSectionM respondsToSelector:@selector(spaceOfColumnInsection)]) {
        return [tmpSectionM spaceOfColumnInsection];
    }
    
    return 0;
}

- (CGFloat)spaceOfRowInSection:(NSInteger)section{
    if (section >= self.sectionModels.count) {
        return 0;
    }
    
    id<XLCollectionSectionDelegate> tmpSectionM = self.sectionModels[section];
    if ([tmpSectionM respondsToSelector:@selector(spaceOfRowInsection)]) {
        return [tmpSectionM spaceOfRowInsection];
    }
    
    return 0;
}

- (UIEdgeInsets)edgeInsetsInSection:(NSInteger)section{
    if (section >= self.sectionModels.count) {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
    
    id<XLCollectionSectionDelegate> tmpSectionM = self.sectionModels[section];
    if ([tmpSectionM respondsToSelector:@selector(edgeInsetsInsection)]) {
        return [tmpSectionM edgeInsetsInsection];
    }
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

//- (CGFloat)heightForHeaderViewInSection:(NSInteger)section;
//- (CGFloat)heightForFooterViewInSection:(NSInteger)section;

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section >= self.sectionModels.count) {
        return 0;
    }
    
    id<XLCollectionSectionDelegate> tmpSectionM = self.sectionModels[section];
    if ([tmpSectionM respondsToSelector:@selector(numberOfItemsInsection)]) {
        return [tmpSectionM numberOfItemsInsection];
    }
    
    return 0;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    if (indexPath.section >= self.sectionModels.count) {
        return cell;
    }
    
    id<XLCollectionSectionDelegate> tmpSectionM = self.sectionModels[indexPath.section];
    if ([tmpSectionM respondsToSelector:@selector(collectionView:cellForItemAtIndexPath:)]) {
        return [tmpSectionM collectionView:collectionView cellForItemAtIndexPath:indexPath];
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.sectionModels.count;
}

/*
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
}
 */

#pragma mark - UICollectionViewDelegate

@end
