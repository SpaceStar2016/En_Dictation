//
//  En_Untils.h
//  EnDICTATION
//
//  Created by Space Zhong on 2019/4/26.
//  Copyright © 2019年 Space Zhong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface En_Untils : NSObject
//根据String 和 fontSize 返回宽度
+(CGFloat)calculateRowWidth:(NSString *)string fontSize:(CGFloat)font;
@end

NS_ASSUME_NONNULL_END
