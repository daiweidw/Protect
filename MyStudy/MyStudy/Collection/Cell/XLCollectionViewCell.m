//
//  XLCollectionViewCell.m
//  MyStudy
//
//  Created by daiwei62 on 2021/5/11.
//

#import "XLCollectionViewCell.h"

@interface XLCollectionViewCell ()

@property (nonatomic, strong) UILabel *titleLab;

@end

@implementation XLCollectionViewCell

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadSubViews];
    }
    return self;
}

- (void)updateTitle:(NSString *)title{
    self.titleLab.text = title?:@"";
}

#pragma mark - private
- (void)loadSubViews{
    self.titleLab.frame = CGRectMake(10, 10, 200, 20);
    [self addSubview:self.titleLab];
}

- (UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.font = [UIFont systemFontOfSize:14];
        _titleLab.textColor = [UIColor blackColor];
        _titleLab.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLab;
}

@end
