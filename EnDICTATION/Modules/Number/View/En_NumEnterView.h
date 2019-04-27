//
//  En_NumEnterView.h
//  EnDICTATION
//
//  Created by Space Zhong on 2019/4/25.
//  Copyright © 2019年 Space Zhong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class En_NumEnterView;
@protocol En_NumEnterViewDelegate <NSObject>

-(void)numEnterView:(En_NumEnterView *)enterView cancelCli:(UIButton *)btn;

-(void)numEnterView:(En_NumEnterView *)enterView confirm:(UIButton *)btn;

@end
@interface En_NumEnterView : UIView
+(instancetype)numEnterView;
@property(nonatomic,weak)id<En_NumEnterViewDelegate>delegate;
@property (weak, nonatomic) IBOutlet UITextField *fromTextField;
@property (weak, nonatomic) IBOutlet UITextField *toTextField;
@end

NS_ASSUME_NONNULL_END
