//
//  En_NumConBar.h
//  EnDICTATION
//
//  Created by Space Zhong on 2019/4/21.
//  Copyright © 2019年 Space Zhong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class En_NumConBar;
@protocol En_NumConBarDelegate <NSObject>

-(void)numConBar:(En_NumConBar *)bar RangeCli:(UIButton*)btn;
-(void)numConBar:(En_NumConBar *)bar PlayCli:(UIButton*)btn;
-(void)numConBar:(En_NumConBar *)bar RateCli:(UIButton*)btn;
@end
@interface En_NumConBar : UIView
+(instancetype)numConBar;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UIButton *rangeBtn;
@property (weak, nonatomic) IBOutlet UIButton *rateBtn;
@property(nonatomic,weak)id<En_NumConBarDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
