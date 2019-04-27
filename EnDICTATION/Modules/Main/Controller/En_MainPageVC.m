//
//  En_MainPageVC.m
//  EnDICTATION
//
//  Created by Space Zhong on 2019/4/19.
//  Copyright © 2019年 Space Zhong. All rights reserved.
//

#import "En_MainPageVC.h"
#import "En_MainPageView.h"
#import "En_MainSetVC.h"
#import "En_NumVC.h"
@interface En_MainPageVC ()<En_MainPageViewDelegate>
@property(nonatomic,weak)En_MainPageView * mainPageView;
@end

@implementation En_MainPageVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    En_MainPageView * mainPageView  = [En_MainPageView mainPageView];
    mainPageView.frame = self.view.bounds;
    mainPageView.delegate = self;
    [self.view addSubview:mainPageView];
    self.mainPageView = mainPageView;
    
    self.view.backgroundColor = En_GlobalWhite;
  
}

#pragma mark En_MainPageViewDelegate

-(void)mainPageView:(En_MainPageView*)pageView numberCli:(UIButton *)btn
{
    En_NumVC * numVC = [[En_NumVC alloc] init];
    [self presentViewController:numVC animated:YES completion:nil];
}
-(void)mainPageView:(En_MainPageView*)pageView dateCli:(UIButton *)btn
{
    NSLog(@"dateCli");
}

-(void)mainPageView:(En_MainPageView*)pageView vocaCli:(UIButton *)btn
{
    NSLog(@"vocaCli");
}
-(void)mainPageView:(En_MainPageView*)pageView senCli:(UIButton *)btn
{
    NSLog(@"senCli");
}

-(void)mainPageView:(En_MainPageView*)pageView settingCli:(UIButton *)btn
{
    En_MainSetVC * setVC = [[En_MainSetVC alloc] init];
    [self presentViewController:setVC animated:YES completion:nil];
}

@end
