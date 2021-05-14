//
//  XLCollectionDataModel.h
//  MyStudy
//
//  Created by daiwei62 on 2021/5/13.
//

#import <Foundation/Foundation.h>
#import "XLCollectionProtocol.h"

@interface XLCollectionDataModel : NSObject

- (NSArray<id<XLCollectionSectionDelegate>> *)dataModels;

@end

