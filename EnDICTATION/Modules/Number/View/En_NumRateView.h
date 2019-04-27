//
//  En_NumRateView.h
//  EnDICTATION
//
//  Created by Space Zhong on 2019/4/21.
//  Copyright © 2019年 Space Zhong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class En_NumRateView;
@class En_NumRateCModel;
@protocol En_NumRateViewDelegate <NSObject>

-(void)numRateView:(En_NumRateView *)numRanView didSelectModel:(En_NumRateCModel *)model;

@end
@interface En_NumRateView : UIView
@property(nonatomic,weak)id<En_NumRateViewDelegate>delegate;
@property(nonatomic,weak)En_NumRateCModel * selectedModel;
@end

NS_ASSUME_NONNULL_END
