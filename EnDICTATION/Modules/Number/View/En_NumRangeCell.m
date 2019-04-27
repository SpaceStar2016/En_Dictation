//
//  En_NumRangeCell.m
//  EnDICTATION
//
//  Created by Space Zhong on 2019/4/21.
//  Copyright © 2019年 Space Zhong. All rights reserved.
//

#import "En_NumRangeCell.h"
#import "En_NumRangeCModel.h"
@interface En_NumRangeCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
@implementation En_NumRangeCell

- (void)awakeFromNib
{
    
    [super awakeFromNib];
    self.titleLabel.textColor  = En_GlobalPurple;
    self.backgroundColor = En_GlobalWhite;
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = En_GlobalPurple.CGColor;
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 35 * 0.5;
    
}

-(void)setModel:(En_NumRangeCModel *)model
{
    self.titleLabel.text = model.title;
    if (model.isSelect)
    {
        self.backgroundColor = En_GlobalPurple;
        self.titleLabel.textColor  = En_GlobalWhite;
    }
    else
    {
        self.backgroundColor = En_GlobalWhite;
        self.titleLabel.textColor  = En_GlobalPurple;
    }
}

@end
