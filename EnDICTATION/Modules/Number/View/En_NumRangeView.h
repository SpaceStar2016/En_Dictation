//
//  En_NumRangeView.h
//  EnDICTATION
//
//  Created by Space Zhong on 2019/4/21.
//  Copyright © 2019年 Space Zhong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class En_NumRangeView;
@class En_NumRangeCModel;
@protocol En_NumRangeViewDelegate <NSObject>

-(void)numRangeView:(En_NumRangeView *)numRanView didSelectModel:(En_NumRangeCModel *)model;

@end
@interface En_NumRangeView : UIView
@property(nonatomic,weak)id<En_NumRangeViewDelegate>delegate;
@property(nonatomic,weak)En_NumRangeCModel * selectedModel;
@end

NS_ASSUME_NONNULL_END
