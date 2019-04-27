//
//  UIView+Frame.h
// Space
//
//  Created by apple on 15-3-5.
//  Copyright (c) 2015年 Space. All rights reserved.
//

#import <UIKit/UIKit.h>

/* 打印frame  */
#define NSLogRect(rect) NSLog(@"%s x:%.2f,y:%.2f,w:%.2f,h:%.2f",#rect,rect.origin.x,rect.origin.y,rect.size.width,rect.size.height)
/* 打印size  */
#define NSLogSize(size) NSLog(@"%s w:%.2f h:%.2f",#size,size.width,size.height)
/* 打印point  */
#define NSLogPoint(point) NSLog(@"%s x:%.2f,y:%.2f",#point,point.x,point.y)


@interface UIView (Frame)
// 分类不能添加成员属性
// @property如果在分类里面，只会自动生成get,set方法的声明，不会生成成员属性，和方法的实现
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;


@end
