//
//  En_NumEnterVC.h
//  EnDICTATION
//
//  Created by Space Zhong on 2019/4/25.
//  Copyright © 2019年 Space Zhong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class En_NumVC;
typedef void (^textFieldCB)(NSNumber * fromNum,NSNumber * toNum);
@interface En_NumEnterVC : UIViewController
@property(nonatomic,copy)textFieldCB textCB;

@end

NS_ASSUME_NONNULL_END
