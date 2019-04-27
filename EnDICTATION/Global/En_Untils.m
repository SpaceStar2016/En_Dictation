//
//  En_Untils.m
//  EnDICTATION
//
//  Created by Space Zhong on 2019/4/26.
//  Copyright © 2019年 Space Zhong. All rights reserved.
//

#import "En_Untils.h"

@implementation En_Untils
//根据String 和 fontSize 返回宽度
+(CGFloat)calculateRowWidth:(NSString *)string fontSize:(CGFloat)font {
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:font]};  //指定字号
    CGRect rect = [string boundingRectWithSize:CGSizeMake(0, 30)/*计算宽度时要确定高度*/ options:NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingUsesFontLeading attributes:dic context:nil];
    return rect.size.width;
}
@end
