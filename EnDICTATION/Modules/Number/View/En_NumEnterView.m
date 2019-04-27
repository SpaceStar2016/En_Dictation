//
//  En_NumEnterView.m
//  EnDICTATION
//
//  Created by Space Zhong on 2019/4/25.
//  Copyright © 2019年 Space Zhong. All rights reserved.
//

#import "En_NumEnterView.h"

@interface En_NumEnterView()

@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *fromLabel;
@property (weak, nonatomic) IBOutlet UILabel *toLabel;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;

@end

@implementation En_NumEnterView

+(instancetype)numEnterView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"En_NumEnterView" owner:nil options:nil] lastObject];
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = En_GlobalPurple.CGColor;
    self.layer.cornerRadius = 25.0f;
    
    [self setupButtonStyle:self.cancelButton];
    [self setupButtonStyle:self.confirmButton];
}

-(void)setupButtonStyle:(UIButton *)btn
{
    btn.backgroundColor = En_GlobalWhite;
    [btn setTitleColor:En_GlobalTextGrey forState:UIControlStateNormal];
    btn.layer.cornerRadius = 5.0;
    btn.layer.shadowColor = En_GlobalPurple.CGColor;
    btn.layer.shadowOpacity = 0.8;
    btn.layer.shadowOffset = CGSizeMake(2,6);
}


- (IBAction)cancelCli:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(numEnterView:cancelCli:)]) {
        [self.delegate numEnterView:self cancelCli:sender];
    }
}

- (IBAction)confirmCli:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(numEnterView:confirm:)]) {
        [self.delegate numEnterView:self confirm:sender];
    }
}

@end
