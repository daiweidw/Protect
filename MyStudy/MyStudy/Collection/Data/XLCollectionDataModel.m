//
//  XLCollectionDataModel.m
//  MyStudy
//
//  Created by daiwei62 on 2021/5/13.
//

#import "XLCollectionDataModel.h"

#import "XLCollectionGraySection.h"
#import "XLCollectionGreenSection.h"
#import "XLCollectionRedSection.h"

@implementation XLCollectionDataModel

- (NSArray<id<XLCollectionSectionDelegate>> *)dataModels{
    XLCollectionGraySection *grayM = [[XLCollectionGraySection alloc] init];
    XLCollectionGreenSection *greenM = [[XLCollectionGreenSection alloc] init];
    XLCollectionRedSection *redM = [[XLCollectionRedSection alloc] init];
    
    NSArray *datas = @[redM, greenM, grayM];
    return datas;
}

@end
