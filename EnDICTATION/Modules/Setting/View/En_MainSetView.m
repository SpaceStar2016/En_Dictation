//
//  En_MainSetView.m
//  EnDICTATION
//
//  Created by Space Zhong on 2019/4/20.
//  Copyright © 2019年 Space Zhong. All rights reserved.
//

#import "En_MainSetView.h"
@interface En_MainSetView()
@property (weak, nonatomic) IBOutlet UIButton *gobackBtn;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
@implementation En_MainSetView

+(instancetype)mainSetView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"En_MainSetView" owner:nil options:nil] lastObject];
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.textLabel.textColor = En_GlobalTextGrey;
}

- (IBAction)gobackCli:(UIButton *)sender
{
    if (self.goback) {
        self.goback();
    }
}

@end
