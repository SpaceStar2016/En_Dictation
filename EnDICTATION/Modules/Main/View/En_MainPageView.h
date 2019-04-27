//
//  En_MainPageView.h
//  EnDICTATION
//
//  Created by Space Zhong on 2019/4/19.
//  Copyright © 2019年 Space Zhong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class En_MainPageView;
@protocol En_MainPageViewDelegate <NSObject>

-(void)mainPageView:(En_MainPageView*)pageView numberCli:(UIButton *)btn;
-(void)mainPageView:(En_MainPageView*)pageView dateCli:(UIButton *)btn;

-(void)mainPageView:(En_MainPageView*)pageView vocaCli:(UIButton *)btn;
-(void)mainPageView:(En_MainPageView*)pageView senCli:(UIButton *)btn;
-(void)mainPageView:(En_MainPageView*)pageView settingCli:(UIButton *)btn;

@end

@interface En_MainPageView : UIView


@property(nonatomic,weak)id<En_MainPageViewDelegate>delegate;

+(instancetype)mainPageView;

@end

NS_ASSUME_NONNULL_END
