//
//  XLCollectionViewModel.h
//  MyStudy
//
//  Created by daiwei62 on 2021/5/12.
//

#import <Foundation/Foundation.h>

#import "XLCollectionProtocol.h"
#import "XLCollectionViewLayout.h"

@interface XLCollectionViewModel : NSObject<UICollectionViewDelegate, UICollectionViewDataSource, XLCollectionViewLayoutDelegate>

@property (nonatomic, strong, readonly) UICollectionView *collectionView;

@property (nonatomic, strong) NSArray<id<XLCollectionSectionDelegate>> *sectionModels;

@end
