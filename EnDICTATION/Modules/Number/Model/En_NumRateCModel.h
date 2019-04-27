//
//  En_NumRateCModel.h
//  EnDICTATION
//
//  Created by Space Zhong on 2019/4/21.
//  Copyright © 2019年 Space Zhong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface En_NumRateCModel : NSObject
@property (nonatomic,copy)NSString * title;
@property(nonatomic,assign)En_NumLevel level;
@property(nonatomic,assign)BOOL isSelect;
@property(nonatomic,assign)double rate;
@property(nonatomic,assign)double interval;
@end

NS_ASSUME_NONNULL_END
