//
//  En_MainSetVC.m
//  EnDICTATION
//
//  Created by Space Zhong on 2019/4/20.
//  Copyright © 2019年 Space Zhong. All rights reserved.
//

#import "En_MainSetVC.h"
#import "En_MainSetView.h"
@interface En_MainSetVC ()
@property(nonatomic,weak)En_MainSetView * setView;
@end

@implementation En_MainSetVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WEAKSELF;
    En_MainSetView * setView = [En_MainSetView mainSetView];
    setView.frame = self.view.bounds;
    setView.goback = ^{
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    };
    [self.view addSubview:setView];
    self.setView = setView;
    
}


@end
