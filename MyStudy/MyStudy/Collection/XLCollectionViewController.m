//
//  XLCollectionViewController.m
//  MyStudy
//
//  Created by daiwei62 on 2021/5/11.
//

#import "XLCollectionViewController.h"

#import "XLCollectionViewModel.h"
#import "XLCollectionDataModel.h"

@interface XLCollectionViewController ()

@property (nonatomic, strong) XLCollectionViewModel *collectionModel;
@property (nonatomic, strong) XLCollectionDataModel *dataModel;

@end

@implementation XLCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionView *collectionView = self.collectionModel.collectionView;
    CGFloat statusH = [[UIApplication sharedApplication] statusBarFrame].size.height + 44;
    collectionView.frame = CGRectMake(0, statusH, CGRectGetWidth([[UIScreen mainScreen] bounds]), CGRectGetHeight([[UIScreen mainScreen] bounds])-statusH);
    [self.view addSubview:collectionView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.collectionModel.sectionModels = self.dataModel.dataModels;
}

#pragma mark - lazy
- (XLCollectionViewModel *)collectionModel{
    if (!_collectionModel) {
        _collectionModel = [[XLCollectionViewModel alloc] init];
    }
    return _collectionModel;
}

- (XLCollectionDataModel *)dataModel{
    if (!_dataModel) {
        _dataModel = [[XLCollectionDataModel alloc] init];
    }
    return _dataModel;
}

@end
