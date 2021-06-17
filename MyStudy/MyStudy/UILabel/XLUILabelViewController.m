//
//  XLUILabelViewController.m
//  MyStudy
//
//  Created by daiwei62 on 2021/6/16.
//

#import "XLUILabelViewController.h"
#import "NSString+XLLabel.h"

@interface XLUILabelViewController ()

@property (nonatomic, strong) UILabel *subTitleLab;

@property (nonatomic, assign) BOOL isOpen;

@end

@implementation XLUILabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self loadSubTitleLab];
}

//@"皮肤是人体内部的反映，让我们一起从内而外,让皮肤散发健康光泽。包在身体表面，直接同外界环境接触，具有保护，调节体温和感受外界刺激等作用的一种器官。是人的身体器官中最重要的。皮肤是人体内部的反映，让我们一起从内而外,让皮肤散发健康光泽。";
- (void)loadSubTitleLab{
    [self.subTitleLab removeFromSuperview];
    
    NSString *tmpTitle = @"皮肤是人体内部的反映，让我们一起从内而外,让皮肤散发健康光泽。包在身体表面，直接同外界环境接触，具有保护，调节体温和感受外界刺激等作用的一种器官。是人的身体器官中最重要的皮肤是人体内部的反映，让我们一起从内而外,让皮肤散发健康光";
    
    NSDictionary *tmpAttributes = [self attributesDic];
    CGFloat tmpW = self.view.frame.size.width-kIphone6Scale(30);
    CGSize tmpContent = CGSizeMake(tmpW, MAXFLOAT);
    
    NSArray *tmpLines = [tmpTitle xl_getLinesArrayOfStringWidth:tmpW attributes:tmpAttributes];
    if (tmpLines.count > 3) {
        if (self.isOpen) {
            NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:tmpTitle attributes:tmpAttributes];
            NSTextAttachment *attch = [[NSTextAttachment alloc] init];
            attch.image = [UIImage imageNamed:@"XLicon_Text_Close"];
            attch.bounds = CGRectMake(0, 0, kIphone6Scale(12),kIphone6Scale(7));
            NSAttributedString *attchstring = [NSAttributedString attributedStringWithAttachment:attch];
            [attri appendAttributedString:attchstring];
            
            CGSize tmpSize = [tmpTitle xl_sizeWithAttributes:tmpAttributes constraintSize:tmpContent attchstring:attchstring];
            
            self.subTitleLab.attributedText = attri;
            self.subTitleLab.frame = CGRectMake(kIphone6Scale(15), 200, tmpW, tmpSize.height);
        }else{
            NSMutableString *subLineStr = [[NSMutableString alloc] init];
            for (NSInteger i = 0; i < 3; i++) {
                NSString *tmpSubStr = tmpLines[i];
                [subLineStr appendString:tmpSubStr];
            }
            NSString *tmpSubStr = [subLineStr substringWithRange:NSMakeRange(0, subLineStr.length-2)];
            NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:tmpSubStr attributes:tmpAttributes];
            NSTextAttachment *attch = [[NSTextAttachment alloc] init];
            attch.image = [UIImage imageNamed:@"XLicon_Text_Close"];
            attch.bounds = CGRectMake(0, 0, kIphone6Scale(12),kIphone6Scale(7));
            NSAttributedString *attchstring = [NSAttributedString attributedStringWithAttachment:attch];
            [attri appendAttributedString:[[NSAttributedString alloc] initWithString:@"   "]];
            [attri appendAttributedString:attchstring];
            
            self.subTitleLab.attributedText = attri;
            self.subTitleLab.frame = CGRectMake(kIphone6Scale(15), 200, tmpW, 3*kIphone6Scale(17));
        }
    }else{
        NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:tmpTitle attributes:tmpAttributes];
        
        CGSize tmpSize = [tmpTitle xl_sizeWithAttributes:tmpAttributes constraintSize:tmpContent attchstring:nil];
        
        self.subTitleLab.frame = CGRectMake(kIphone6Scale(15), 200, tmpW, tmpSize.height);
        self.subTitleLab.attributedText = attri;
    }
    
    [self.view addSubview:self.subTitleLab];
}

- (NSDictionary *)attributesDic{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.minimumLineHeight = kIphone6Scale(17);
    paragraphStyle.maximumLineHeight = kIphone6Scale(17);
    paragraphStyle.alignment = NSTextAlignmentLeft;
    NSDictionary *tmpAttributes = @{
        NSFontAttributeName : [UIFont fontWithName:@"PingFangSC-Regular" size:kIphone6Scale(12)],
        NSForegroundColorAttributeName:[UIColor blackColor],
        NSParagraphStyleAttributeName : paragraphStyle
    };
    return tmpAttributes;
}

- (void)changeTitleOpen{
    self.isOpen = !self.isOpen;
    
    [self loadSubTitleLab];
}

- (UILabel *)subTitleLab{
    if (!_subTitleLab) {
        _subTitleLab = [[UILabel alloc] init];
        _subTitleLab.numberOfLines = 0;
        _subTitleLab.userInteractionEnabled = YES;
        _subTitleLab.lineBreakMode = NSLineBreakByClipping;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeTitleOpen)];
        [_subTitleLab addGestureRecognizer:tap];
    }
    return _subTitleLab;
}

@end
