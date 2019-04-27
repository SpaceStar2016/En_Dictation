//
//  En_NumAnCell.m
//  EnDICTATION
//
//  Created by Space Zhong on 2019/4/21.
//  Copyright © 2019年 Space Zhong. All rights reserved.
//

#import "En_NumAnCell.h"
#import "En_NumAnModel.h"
@interface En_NumAnCell()
@property (weak, nonatomic)UILabel *titleLabel;

@end

@implementation En_NumAnCell

- (void)awakeFromNib {
    [super awakeFromNib];

    
    UILabel * titleLabel = [[UILabel alloc] init];
    titleLabel.textColor = En_GlobalTextGrey;
    titleLabel.font = [UIFont systemFontOfSize:17];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
//    self.backgroundColor = SPSRandomColor;
    //圆角和阴影并存~~
    CALayer *subLayer=[CALayer layer];
    CGRect fixframe = self.titleLabel.frame;
    subLayer.frame= fixframe;
    subLayer.cornerRadius= 6;
    subLayer.backgroundColor= En_GlobalWhite.CGColor;
    subLayer.masksToBounds= NO;
    subLayer.shadowColor = En_GlobalPurple.CGColor;//shadowColor阴影颜色
    subLayer.shadowOffset = CGSizeMake(0,2);//shadowOffset阴影偏移,x向右偏移3，y向下偏移2，默认(0, -3),这个跟shadowRadius配合使用
    subLayer.shadowOpacity = 0.8;//阴影透明度，默认0
    subLayer.shadowRadius = 4;//阴影半径，默认3
    [self.layer insertSublayer:subLayer below:self.contentView.layer];
    
//    self.titleLabel.backgroundColor = SPSRandomColor;
//    self.backgroundColor = SPSRandomColor;

}

-(void)setModel:(En_NumAnModel *)model
{
    _model = model;
    self.titleLabel.text = model.title;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat gap = 5;
    self.titleLabel.frame = CGRectMake(gap,gap,self.width - gap * 2, self.height - gap * 2);
    NSLog(@"titleFrame===%@",NSStringFromCGRect(self.titleLabel.frame));
}

@end
