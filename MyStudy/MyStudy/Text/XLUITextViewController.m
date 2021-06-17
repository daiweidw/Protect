//
//  XLUITextViewController.m
//  MyStudy
//
//  Created by daiwei62 on 2021/6/11.
//

#import "XLUITextViewController.h"
#import "XLTextView.h"

@interface XLUITextViewController ()<UITextViewDelegate>

@property (nonatomic, strong) XLTextView *subTitleLab;

@end

@implementation XLUITextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self loadTextView];
}

- (void)loadTextView{
    NSString *testText = @"皮肤是人体内部的反映，让我们一起从内而外,让皮肤散发健康光泽。包在身体表面，直接同外界环境接触，具有保护，调节体温和感受外界刺激等作用的一种器官。是人的身体器官中最重要的。皮肤是人体内部的反映，让我们一起从内而外,让皮肤散发健康光泽。";
    
    
    [self.view addSubview:self.subTitleLab];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.minimumLineHeight = kIphone6Scale(17);
    paragraphStyle.maximumLineHeight = kIphone6Scale(17);
    paragraphStyle.alignment = NSTextAlignmentLeft;
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:testText
                                                                 attributes:@{
                                                                              NSFontAttributeName : [UIFont fontWithName:@"PingFangSC-Regular" size:kIphone6Scale(12)],
                                                                              NSForegroundColorAttributeName : [UIColor whiteColor],
                                                                              NSParagraphStyleAttributeName : paragraphStyle
                                                                              }];
    
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    attch.image = [UIImage imageNamed:@"XLicon_Text_Close"];
    attch.bounds = CGRectMake(0, 0, kIphone6Scale(12),kIphone6Scale(7));
    NSMutableAttributedString *attchstring = [NSMutableAttributedString attributedStringWithAttachment:attch];
    [attchstring addAttribute:NSLinkAttributeName value:[NSURL URLWithString:@"IMageIconClose://"] range:NSMakeRange(0, attchstring.length)];
    [attri appendAttributedString:attchstring];
    
    self.subTitleLab.attributedText = attri;
    
    CGSize yuyanSize = [self.subTitleLab sizeThatFits:CGSizeMake(self.view.frame.size.width-kIphone6Scale(30), MAXFLOAT)];
    
    self.subTitleLab.frame = CGRectMake(kIphone6Scale(15), 200, self.view.frame.size.width-kIphone6Scale(30), yuyanSize.height);
}

#pragma mark - uitextview delegate
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange{
    if ([[URL scheme] isEqualToString:@"IMageIconClose"]) {
        
    }
    return NO;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction API_AVAILABLE(ios(10.0)){
    if ([[URL scheme] isEqualToString:@"IMageIconClose"]) {
        
    }
    return NO;
}

- (XLTextView *)subTitleLab {
    if (!_subTitleLab) {
        _subTitleLab = [[XLTextView alloc] init];
        _subTitleLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:kIphone6Scale(12)];
        _subTitleLab.textColor = [UIColor whiteColor];
        _subTitleLab.delegate = self;
        _subTitleLab.backgroundColor = [UIColor blueColor];
        _subTitleLab.scrollEnabled = NO;
        _subTitleLab.editable = NO;
        _subTitleLab.selectable = YES;
        _subTitleLab.textContainer.lineFragmentPadding = 0;
        _subTitleLab.textContainerInset = UIEdgeInsetsZero;
//        _subTitleLab.dataDetectorTypes = UIDataDetectorTypeLink;
    }
    return _subTitleLab;
}

@end
