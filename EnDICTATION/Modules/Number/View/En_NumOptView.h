//
//  En_NumOptView.h
//  EnDICTATION
//
//  Created by Space Zhong on 2019/4/21.
//  Copyright © 2019年 Space Zhong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class En_NumAnswerView;
@class En_NumOptCModel;
@interface En_NumOptView : UIView

@property(nonatomic,weak)En_NumAnswerView * anView;
-(void)options:(NSMutableArray<En_NumOptCModel*> *)opts answers:(NSNumber*)index;
@end

NS_ASSUME_NONNULL_END
