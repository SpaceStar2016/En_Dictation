//
//  En_NumConBar.m
//  EnDICTATION
//
//  Created by Space Zhong on 2019/4/21.
//  Copyright © 2019年 Space Zhong. All rights reserved.
//

#import "En_NumConBar.h"

@interface En_NumConBar()

@property (weak, nonatomic) IBOutlet UIView *line;


@end

@implementation En_NumConBar

+(instancetype)numConBar
{
    return [[[NSBundle mainBundle] loadNibNamed:@"En_NumConBar" owner:nil options:nil]lastObject];
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.backgroundColor = En_GlobalWhite;
    self.line.backgroundColor = [En_GlobalPurple colorWithAlphaComponent:0.5];
    
}

- (IBAction)rangeCli:(UIButton *)sender
{
    self.rateBtn.selected = NO;
    sender.selected = !sender.selected;
    if ([self.delegate respondsToSelector:@selector(numConBar:RangeCli:)]) {
        [self.delegate numConBar:self RangeCli:sender];
    }
}
- (IBAction)playCli:(UIButton *)sender
{
    
    sender.selected = !sender.selected;
    if ([self.delegate respondsToSelector:@selector(numConBar:PlayCli:)]) {
        [self.delegate numConBar:self PlayCli:sender];
    }
}
- (IBAction)rateCli:(UIButton *)sender
{
    self.rangeBtn.selected = NO;
    sender.selected = !sender.selected;
    if ([self.delegate respondsToSelector:@selector(numConBar:RateCli:)]) {
        [self.delegate numConBar:self RateCli:sender];
    }
}

@end
