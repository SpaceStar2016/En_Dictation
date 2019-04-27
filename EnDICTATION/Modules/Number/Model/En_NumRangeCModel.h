//
//  En_NumRangeCModel.h
//  EnDICTATION
//
//  Created by Space Zhong on 2019/4/21.
//  Copyright © 2019年 Space Zhong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface En_NumRangeCModel : NSObject

@property (nonatomic,copy)NSString * title;
@property(nonatomic,assign)En_NumRange range;
@property(nonatomic,assign)BOOL isSelect;
@end

NS_ASSUME_NONNULL_END
