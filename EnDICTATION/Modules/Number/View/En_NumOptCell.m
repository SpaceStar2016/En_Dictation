//
//  En_NumOptCell.m
//  EnDICTATION
//
//  Created by Space Zhong on 2019/4/21.
//  Copyright © 2019年 Space Zhong. All rights reserved.
//

#import "En_NumOptCell.h"
#import "En_NumOptCModel.h"
@interface En_NumOptCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *line;

@end
@implementation En_NumOptCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundColor = En_GlobalWhite;
    self.titleLabel.textColor = En_GlobalTextGrey;
    self.titleLabel.layer.shadowColor = En_GlobalPurple.CGColor;
    self.titleLabel.layer.shadowOpacity = 0.8;
    self.titleLabel.layer.shadowOffset = CGSizeMake(2,6);
    self.line.backgroundColor = [En_GlobalPurple colorWithAlphaComponent:0.5];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(En_NumOptCModel *)model
{
    _model = model;
    self.titleLabel.text = model.title;
    
}

@end
