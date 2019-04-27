//
//  En_NumEnterVC.m
//  EnDICTATION
//
//  Created by Space Zhong on 2019/4/25.
//  Copyright © 2019年 Space Zhong. All rights reserved.
//

#import "En_NumEnterVC.h"
#import "En_NumVC.h"
#import "En_NumEnterView.h"
@interface En_NumEnterVC ()<En_NumEnterViewDelegate>
@property(nonatomic,weak)En_NumEnterView * enterView;
@end

@implementation En_NumEnterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [En_GlobalBlack colorWithAlphaComponent:0.45];
    CGFloat enterViewW = ScreenW * 0.8;
    CGFloat enterViewH = ScreenH * 0.3;
    En_NumEnterView * enterView = [En_NumEnterView numEnterView];
    enterView.frame = CGRectMake((self.view.width - enterViewW) * 0.5,(self.view.height - enterViewH) * 0.5, enterViewW, enterViewH);
    enterView.delegate = self;
    [self.view addSubview:enterView];
    self.enterView = enterView;

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self.view addSubview:self.numVC.blurView];
//    [self.view insertSubview:self.numVC.blurView atIndex:0];
}

-(void)numEnterView:(En_NumEnterView *)enterView cancelCli:(UIButton *)btn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)numEnterView:(En_NumEnterView *)enterView confirm:(UIButton *)btn
{
    NSLog(@"confirm");
    if (self.textCB) {
        NSNumber * fromNum = [NSNumber numberWithInteger:self.enterView.fromTextField.text.integerValue];
        NSNumber * toNum = [NSNumber numberWithInteger:self.enterView.toTextField.text.integerValue];
        self.textCB(fromNum,toNum);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
