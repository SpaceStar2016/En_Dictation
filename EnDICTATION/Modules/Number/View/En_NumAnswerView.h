//
//  En_NumAnswerView.h
//  EnDICTATION
//
//  Created by Space Zhong on 2019/4/21.
//  Copyright © 2019年 Space Zhong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class En_NumAnswerView;
@class En_NumAnModel;
@protocol En_NumAnswerViewDelegate <NSObject>

-(void)numAnswerView:(En_NumAnswerView*)anView showAnCli:(UIButton *)btn;

@end
@interface En_NumAnswerView : UIView
@property(nonatomic,weak)id<En_NumAnswerViewDelegate>delegate;
@property(nonatomic,strong)NSMutableArray * anDatas;
-(void)addAnData:(En_NumAnModel *)num;
-(void)addYourOptData:(En_NumAnModel *)num;

-(void)clear;
@end

NS_ASSUME_NONNULL_END
