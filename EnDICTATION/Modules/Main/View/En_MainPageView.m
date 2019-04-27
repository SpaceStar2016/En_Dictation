//
//  En_MainPageView.m
//  EnDICTATION
//
//  Created by Space Zhong on 2019/4/19.
//  Copyright © 2019年 Space Zhong. All rights reserved.
//

#import "En_MainPageView.h"

@interface En_MainPageView()
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UIButton *numBtn;
@property (weak, nonatomic) IBOutlet UIButton *dateBtn;
@property (weak, nonatomic) IBOutlet UIButton *vocaBtn;

@property (weak, nonatomic) IBOutlet UIButton *senBtn;
@property (weak, nonatomic) IBOutlet UIButton *settingBtn;

@end

@implementation En_MainPageView

+(instancetype)mainPageView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"En_MainPageView" owner:nil options:nil] lastObject];
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    self.backgroundColor = En_GlobalWhite;
    
    [self setupButtonStyle:self.numBtn];
    CGAffineTransform numTra = CGAffineTransformIdentity;
    self.numBtn.transform = CGAffineTransformRotate(numTra,M_PI * 0.10);
    
    

    [self setupButtonStyle:self.dateBtn];
    CGAffineTransform dateTra = CGAffineTransformIdentity;
    self.dateBtn.transform = CGAffineTransformRotate(dateTra,M_PI * -0.10);
    
    
    [self setupButtonStyle:self.vocaBtn];
    CGAffineTransform vocaTra = CGAffineTransformIdentity;
    self.vocaBtn.transform = CGAffineTransformRotate(vocaTra,M_PI * 0.10);
    
    
    [self setupButtonStyle:self.senBtn];
    CGAffineTransform senTra = CGAffineTransformIdentity;
    self.senBtn.transform = CGAffineTransformRotate(senTra,M_PI * -0.10);
    
    
    self.settingBtn.backgroundColor = En_GlobalPurple;
    self.settingBtn.layer.cornerRadius = 8.0;
    self.settingBtn.layer.shadowColor = En_GlobalPurple.CGColor;
    self.settingBtn.layer.shadowOpacity = 0.8;
    self.settingBtn.layer.shadowOffset = CGSizeMake(0,3);
}


-(void)setupButtonStyle:(UIButton *)btn
{
    btn.backgroundColor = En_GlobalWhite;
    [btn setTitleColor:En_GlobalTextGrey forState:UIControlStateNormal];
    btn.layer.cornerRadius = 10.0;
    btn.layer.shadowColor = En_GlobalPurple.CGColor;
    btn.layer.shadowOpacity = 0.8;
    btn.layer.shadowOffset = CGSizeMake(2,6);
}

- (IBAction)numCli:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(mainPageView:numberCli:)])
    {
        [self.delegate mainPageView:self numberCli:btn];
    }
    
}
- (IBAction)dateBtn:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(mainPageView:dateCli:)]) {
        [self.delegate mainPageView:self dateCli:btn];
    }
}

- (IBAction)vocaBtn:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(mainPageView:vocaCli:)]) {
        [self.delegate mainPageView:self vocaCli:btn];
    }
}

- (IBAction)senBtn:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(mainPageView:senCli:)]) {
        [self.delegate mainPageView:self senCli:btn];
    }
}

- (IBAction)settingCli:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(mainPageView:settingCli:)]) {
        [self.delegate mainPageView:self settingCli:btn];
    }
}

@end
