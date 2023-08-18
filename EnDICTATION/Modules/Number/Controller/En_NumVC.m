//
//  En_NumVC.m
//  EnDICTATION
//
//  Created by Space Zhong on 2019/4/20.
//  Copyright © 2019年 Space Zhong. All rights reserved.
//

#import "En_NumVC.h"
#import "En_NumConBar.h"
#import "En_NumRangeView.h"
#import "En_NumRateView.h"
#import "En_NumAnswerView.h"
#import "En_NumOptView.h"
#import "En_NumRangeCModel.h"
#import "En_NumRateCModel.h"
#import "En_NumOptCModel.h"
#import "En_NumEnterView.h"
#import "En_NumEnterVC.h"
#import "En_NumAnModel.h"
#import <AVFoundation/AVFoundation.h>
#define ViewTotalHeight (self.view.frame.size.height)
#define NumTopGap (30)
#define NumBottomGap (30)
#define NumGobackHeight (36)
#define NumConBarH (60)
#define NumGap (10)
#define TotalRatio ((ViewTotalHeight - NumTopGap - NumBottomGap - NumGobackHeight - NumConBarH - NumGap * 2) / ViewTotalHeight)
#define AnViewRate (0.12)
#define OptViewRate (TotalRatio - AnViewRate)
#define RanRateViewHeight (100)

@interface En_NumVC ()<En_NumConBarDelegate,En_NumRangeViewDelegate,En_NumRateViewDelegate,AVSpeechSynthesizerDelegate,En_NumAnswerViewDelegate>
@property(nonatomic,weak)UIButton * goback;
@property(nonatomic,weak)En_NumConBar * conBar;
@property(nonatomic,weak)En_NumRangeView * rangeView;
@property(nonatomic,weak)En_NumRateView * rateView;
@property(nonatomic,weak)En_NumAnswerView * anView;
@property(nonatomic,weak)En_NumOptView * optView;
@property(nonatomic,weak)En_NumEnterView * enterView;
@property(nonatomic,weak)UIView * cover;
@property(nonatomic,weak)UILabel * titleLabel;
@property(nonatomic,assign)CGRect conBarORect;
@property(nonatomic,assign)CGRect conBarRect;
@property(nonatomic,assign)CGRect rangeORect;
@property(nonatomic,assign)CGRect rangeRect;
@property(nonatomic,assign)CGRect rateORect;
@property(nonatomic,assign)CGRect rateRect;
@property(nonatomic,strong)NSMutableArray * data0ToTwelve;
//文字转语音
@property(nonatomic,strong)AVSpeechSynthesizer *voice;
@property(nonatomic,strong)NSTimer * timer;
@property(nonatomic,assign)NSTimeInterval interval;
@property(nonatomic,assign)NSTimeInterval rate;
@property(nonatomic,assign)En_NumRange range;
@property(nonatomic,assign)En_NumLevel level;
@property(nonatomic,strong)NSMutableArray * data1X;
@property(nonatomic,strong)NSMutableArray * dataX0;
@property(nonatomic,assign)BOOL isGaming;
@property(nonatomic,strong)NSNumber * fromNum;
@property(nonatomic,strong)NSNumber * toNum;
@end

@implementation En_NumVC

-(NSMutableArray *)data1X
{
    if (_data1X == nil)
    {
        _data1X = [NSMutableArray array];
    }
    return _data1X;
}
-(NSMutableArray *)dataX0
{
    if (_dataX0 == nil)
    {
        _dataX0 = [NSMutableArray array];
    }
    return _dataX0;
}
-(NSMutableArray *)data0ToTwelve
{
    if (_data0ToTwelve == nil)
    {
        _data0ToTwelve = [NSMutableArray array];
    }
    return _data0ToTwelve;
}

#pragma mark life-cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = En_GlobalWhite;
    
    CGFloat gobackH = NumGobackHeight;
    CGFloat gobackW = gobackH;
    UIButton * goback = [[UIButton alloc] initWithFrame:CGRectMake(10,30,gobackW,gobackH)];
    [goback setImage:[UIImage imageNamed:@"En_MainBack"] forState:UIControlStateNormal];
    [goback addTarget:self action:@selector(gobackCli:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goback];
    self.goback = goback;
    
    CGFloat titleW = 100;
    CGFloat titleH = 44;
    UILabel * titleLabel = [[UILabel alloc] init];
    titleLabel.frame = CGRectMake((self.view.width - titleW) * 0.5,goback.y,titleW,titleH);
    titleLabel.textColor = En_GlobalTextGrey;
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.text = @"数字和日期";
    [self.view addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    
    En_NumAnswerView * anView = [[En_NumAnswerView alloc] initWithFrame:CGRectMake(0,CGRectGetMaxY(goback.frame) + NumGap,self.view.width,self.view.height * AnViewRate)];
    anView.delegate = self;
    [self.view addSubview:anView];
    self.anView = anView;
    
    En_NumOptView * optView = [[En_NumOptView alloc] initWithFrame:CGRectMake(0,CGRectGetMaxY(anView.frame) + NumGap,self.view.width,self.view.height * OptViewRate)];
    optView.layer.cornerRadius = 10.0f;
    optView.layer.borderWidth = 0.5;
    optView.layer.borderColor = En_GlobalPurple.CGColor;
    optView.layer.masksToBounds = YES;
    [self.view addSubview:optView];
    self.optView = optView;
    
    CGFloat conBarH = NumConBarH;
    self.conBarORect = CGRectMake(0,CGRectGetMaxY(optView.frame),self.view.width, conBarH);

    En_NumConBar * conBar = [En_NumConBar numConBar];
    conBar.frame = self.conBarORect;
    conBar.delegate = self;
    [self.view addSubview:conBar];
    self.conBar = conBar;
    
    
    CGFloat rangeViewH = RanRateViewHeight;
    self.rangeORect = CGRectMake(0,self.view.height,self.view.width,rangeViewH);
    self.rangeRect = CGRectMake(0,self.view.height - rangeViewH,self.view.width,self.view.height);
    En_NumRangeView * rangeView  = [[En_NumRangeView alloc] initWithFrame:self.rangeORect];
    rangeView.delegate = self;
    [self.view addSubview:rangeView];
    self.rangeView = rangeView;
    
    
    CGFloat rateViewH = rangeViewH;
    self.rateORect = CGRectMake(0,self.view.height,self.view.width,rangeViewH);
    self.rateRect = CGRectMake(0,self.view.height - rateViewH,self.view.width,self.view.height);
    En_NumRateView * rateView =  [[En_NumRateView alloc] initWithFrame:self.rateORect];
    rateView.delegate = self;
    [self.view addSubview:rateView];
    self.rateView = rateView;
    
    //EnterView&Cover
//    UIView * cover = [[UIView alloc] initWithFrame:self.view.bounds];
//    cover.backgroundColor = [UIColor clearColor];
//    cover.hidden = YES;
//    [self.view addSubview:cover];
//    self.cover = cover;
//    CGFloat enterViewW = ScreenW * 0.8;
//    CGFloat enterViewH = ScreenH * 0.3;
//    En_NumEnterView * enterView = [En_NumEnterView numEnterView];
//    enterView.frame = CGRectMake((self.view.width - enterViewW) * 0.5,(self.view.height - enterViewH) * 0.5, enterViewW, enterViewH);
//    [self.cover addSubview:enterView];
//    self.enterView = enterView;
    
    
    self.conBarRect = CGRectMake(0,self.rangeRect.origin.y - conBarH,self.view.width, conBarH);
    
    self.optView.anView = self.anView;
    //语音模块
    self.voice = [[AVSpeechSynthesizer alloc] init];
    self.voice.delegate = self;
    
    [self gendatas];
    
    //初始化设置
    self.range = self.rangeView.selectedModel.range;
    self.level = self.rateView.selectedModel.level;
    self.interval = self.rateView.selectedModel.interval;
    self.rate = self.rateView.selectedModel.rate;
    
    [self initialData];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self stopSpeaking];
}

-(void)initialData
{
    NSNumber * num11 = [NSNumber numberWithInteger:11];
    NSNumber * num12 = [NSNumber numberWithInteger:12];
    NSNumber * num13 = [NSNumber numberWithInteger:13];
    NSNumber * num14 = [NSNumber numberWithInteger:14];
    NSNumber * num15 = [NSNumber numberWithInteger:15];
    NSNumber * num16 = [NSNumber numberWithInteger:16];
    NSNumber * num17 = [NSNumber numberWithInteger:17];
    NSNumber * num18 = [NSNumber numberWithInteger:18];
    NSNumber * num19 = [NSNumber numberWithInteger:19];
    NSNumber * num20 = [NSNumber numberWithInteger:20];
    NSNumber * num30 = [NSNumber numberWithInteger:30];
    NSNumber * num40 = [NSNumber numberWithInteger:40];
    NSNumber * num50 = [NSNumber numberWithInteger:50];
    NSNumber * num60 = [NSNumber numberWithInteger:60];
    NSNumber * num70 = [NSNumber numberWithInteger:70];
    NSNumber * num80 = [NSNumber numberWithInteger:80];
    NSNumber * num90 = [NSNumber numberWithInteger:90];
    
    [self.data1X addObject:num11];
    [self.data1X addObject:num12];
    [self.data1X addObject:num13];
    [self.data1X addObject:num14];
    [self.data1X addObject:num15];
    [self.data1X addObject:num16];
    [self.data1X addObject:num17];
    [self.data1X addObject:num18];
    [self.data1X addObject:num19];
    
    
    [self.dataX0 addObject:num20];
    [self.dataX0 addObject:num20];
    [self.dataX0 addObject:num30];
    [self.dataX0 addObject:num40];
    [self.dataX0 addObject:num50];
    [self.dataX0 addObject:num60];
    [self.dataX0 addObject:num70];
    [self.dataX0 addObject:num80];
    [self.dataX0 addObject:num90];
}

-(void)stopSpeaking
{
    [self.voice stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    //self.voice = nil 才能释放内存~~
    self.voice = nil;
    //清除答案
    [self.anView clear];
}

-(void)pauseSpeaking
{
    //清除答案
    [self.anView clear];
    [self.voice stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    NSLog(@"---%d",[self.voice isPaused]);
}

-(void)gendatas
{
    while(self.data0ToTwelve.count < 5)
    {
        int value = arc4random()% 13;
        NSNumber * num00 =  [NSNumber numberWithInt:value];
        BOOL shouldAdd = YES;
        for (NSNumber * num in self.data0ToTwelve)
        {
//            NSLog(@"num==%d---num00=%d",num.intValue,num00.intValue);
            if ([num isEqual:num00])
            {
                shouldAdd = NO;
                break;
            }
        }
        if (shouldAdd == YES)
        {
            [self.data0ToTwelve addObject:num00];
        }
    }
    NSLog(@"count===%lu",(unsigned long)self.data0ToTwelve.count);
    
}


-(void)gobackCli:(UIButton*)btn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark En_NumConBarDelegate
-(void)numConBar:(En_NumConBar *)bar RangeCli:(UIButton*)btn
{
    self.rangeView.hidden = NO;
    if (btn.selected)
    {
        [UIView animateWithDuration:0.3 animations:^{
            self.rateView.hidden = YES;
            self.rangeView.frame = self.rangeRect;
            self.conBar.frame = self.conBarRect;
        }];
    }
    else
    {
        [UIView animateWithDuration:0.3 animations:^{
            self.rangeView.frame = self.rangeORect;
            self.conBar.frame = self.conBarORect;
        }];
    }
}
//"[AVSpeechSynthesisVoice 0x978b580] Language: en-GB",英语(英国)
//"[AVSpeechSynthesisVoice 0x978b810] Language: en-US",英语(美国)
//zh-CN
-(void)numConBar:(En_NumConBar *)bar PlayCli:(UIButton*)btn
{
    NSLog(@"PlayCli");
    if (btn.selected)
    {
        [self.anView clear];
        switch (self.range) {
            case En_NumRangeZTT:
            {
                [self genZeroTOTwelveData];
            }
                break;
            case En_NumRange1XTX0:
            {
                [self gen1XTX0Data];
            }
                break;
            case En_NumRangeCus:
            {
                [self genCusData];
            }
                break;
            case En_NumDate:
            {
                [self genDateData];
            }
                break;

            default:
            {
                [self genZeroTOTwelveData];
            }
                break;
        }
        self.isGaming = YES;
    }
    else
    {
        [self.voice stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
        self.isGaming = NO;
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        self.conBar.frame = self.conBarORect;
        self.rangeView.frame = self.rangeORect;
        self.rateView.frame = self.rangeORect;
    }];
}

-(void)genZeroTOTwelveData
{
    NSMutableArray * data = [NSMutableArray array];
    while(data.count < 5)
    {
        int value = arc4random()% 13;
        NSNumber * num00 =  [NSNumber numberWithInt:value];
        BOOL shouldAdd = YES;
        for (NSNumber * num in data)
        {
            if ([num isEqual:num00])
            {
                shouldAdd = NO;
                break;
            }
        }
        if (shouldAdd == YES)
        {
            En_NumOptCModel * optModel = [[En_NumOptCModel alloc] init];
            optModel.title = [NSString stringWithFormat:@"%ld",num00.integerValue];
            [data addObject:optModel];
        }
    }
    int index = arc4random()% 5;
    [self.optView options:data answers:[NSNumber numberWithInt:index]];
    En_NumOptCModel * optModel = data[index];
    En_NumAnModel * model   = [[En_NumAnModel alloc] init];
    model.title = optModel.title;
    [self.anView addAnData:model];
    //发音
    [self pronounce:model];
}

-(void)gen1XTX0Data
{
    
    NSMutableArray * data = [NSMutableArray array];
    while(data.count < 6)
    {
        int value = arc4random()% 9;
        NSNumber * num00 =  self.data1X[value];
        NSNumber * num01 =  self.dataX0[value];
        BOOL shouldAdd00 = YES;
        BOOL shouldAdd01 = YES;
        for (NSNumber * num in data)
        {
            if ([num isEqual:num00])
            {
                shouldAdd00 = NO;
                continue;
            }
            if ([num isEqual:num01]) {
                shouldAdd01 = NO;
                continue;
            }
        }
        if (shouldAdd00 == YES)
        {
            En_NumOptCModel * optModel = [[En_NumOptCModel alloc] init];
            optModel.title = [NSString stringWithFormat:@"%ld",num00.integerValue];
            [data addObject:optModel];
        }
        if (shouldAdd01 == YES)
        {
            En_NumOptCModel * optModel = [[En_NumOptCModel alloc] init];
            optModel.title = [NSString stringWithFormat:@"%ld",num01.integerValue];
            [data addObject:optModel];
        }
    }
    int index = arc4random()% 6;
    [self.optView options:data answers:[NSNumber numberWithInt:index]];
    En_NumOptCModel * optModel = data[index];
    En_NumAnModel * anModel   = [[En_NumAnModel alloc] init];
    anModel.title = optModel.title;
    [self.anView addAnData:anModel];
    //发音
    [self pronounce:anModel];
}

-(void)genCusData
{
    NSInteger fromI = self.fromNum.integerValue;
    NSInteger toI = self.toNum.integerValue;
    NSInteger diff = toI - fromI + 1;
//    NSInteger rand = arc4random() % diff + fromI;
    NSMutableArray * data = [NSMutableArray array];
    while(data.count < 5)
    {
        NSInteger value = arc4random() % diff + fromI;;
        NSNumber * num00 =  [NSNumber numberWithInteger:value];
        BOOL shouldAdd = YES;
        for (NSNumber * num in data)
        {
            if ([num isEqual:num00])
            {
                shouldAdd = NO;
                break;
            }
        }
        if (shouldAdd == YES)
        {
            En_NumOptCModel * optModel = [[En_NumOptCModel alloc] init];
            optModel.title = [NSString stringWithFormat:@"%ld",num00.integerValue];
            [data addObject:optModel];
        }
    }
    int index = arc4random()% 5;
    [self.optView options:data answers:[NSNumber numberWithInt:index]];
    En_NumOptCModel * optModel = data[index];
    En_NumAnModel * model   = [[En_NumAnModel alloc] init];
    model.title = optModel.title;
    [self.anView addAnData:model];
    
    //发音
    [self pronounce:model];
}

-(void)genDateData
{
    //产生1000 ~ 2100 年
    NSMutableArray * data = [NSMutableArray array];
    for (int i = 0;i < 5; i++) {
        NSInteger year = arc4random() % 1101 + 1000;
        //产生0 ~ 12 月份
        NSInteger month = arc4random() % 12 + 1;
        //产生日
        NSInteger day = arc4random() % 31 + 1;
        NSString * date = nil;
        if (month < 10 && day >= 10)
        {
            date = [NSString stringWithFormat:@"%ld-0%ld-%ld",year,month,day];
        }
        else if (month >=10 && day <10)
        {
            date = [NSString stringWithFormat:@"%ld-%ld-0%ld",year,month,day];
        }
        else if (month < 10 && day < 10)
        {
            date = [NSString stringWithFormat:@"%ld-0%ld-0%ld",year,month,day];
        }
        else
        {
            date = [NSString stringWithFormat:@"%ld-%ld-%ld",year,month,day];
        }
        En_NumOptCModel * model   = [[En_NumOptCModel alloc] init];
        model.title = date;
        [data addObject:model];
    }
    int index = arc4random()% 5;
    [self.optView options:data answers:[NSNumber numberWithInt:index]];
    En_NumOptCModel * optModel = data[index];
    En_NumAnModel * model   = [[En_NumAnModel alloc] init];
    model.title = optModel.title;
    [self.anView addAnData:model];
    //发音
    [self pronounce:model];
}
-(void)pronounce:(En_NumBaseModel *)model
{
    AVSpeechUtterance * speech = [[AVSpeechUtterance alloc] initWithString:model.title];
//    AVSpeechUtterance * speech = [[AVSpeechUtterance alloc] initWithString:@"2003-09-12"];

    speech.rate = self.rate;
    AVSpeechSynthesisVoice *language = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-GB"];
    speech.voice = language;
    [self.voice speakUtterance:speech];
}

-(void)numConBar:(En_NumConBar *)bar RateCli:(UIButton*)btn
{
    self.rateView.hidden = NO;
    if (btn.selected)
    {
        [UIView animateWithDuration:0.3 animations:^{
            self.rangeView.hidden = YES;
            self.rateView.frame = self.rateRect;
            self.conBar.frame = self.conBarRect;
        }];
    }
    else
    {
        [UIView animateWithDuration:0.3 animations:^{
            self.rateView.frame = self.rateORect;
            self.conBar.frame = self.conBarORect;
        }];
    }
}

#pragma mark En_NumRangeViewDelegate
//En_NumRangeZTT = 0,
//En_NumRange1XTX0,
//En_NumRangeCus
-(void)numRangeView:(En_NumRangeView *)numRanView didSelectModel:(En_NumRangeCModel *)model
{
    [UIView animateWithDuration:0.3 animations:^{
        self.conBar.frame = self.conBarORect;
        self.rangeView.frame = self.rangeORect;
        self.rateView.frame = self.rangeORect;
        
    }];
    self.conBar.rangeBtn.selected = NO;
    self.conBar.rateBtn.selected = NO;
    self.range = model.range;
    //弹出自定数字选项
    if (model.range == En_NumRangeCus)
    {
        WEAKSELF;
        En_NumEnterVC * eVC = [[En_NumEnterVC alloc] init];
        eVC.modalPresentationStyle = UIModalPresentationFullScreen;
        eVC.textCB = ^(NSNumber * _Nonnull fromNum, NSNumber * _Nonnull toNum) {
            weakSelf.fromNum = fromNum;
            weakSelf.toNum = toNum;
        };
        [self presentViewController:eVC animated:YES completion:nil];
    }
    
}

#pragma mark  En_NumRateViewDelegate
//En_NumLevelBronze = 0,
//En_NumLevelSilver,
//En_NumLevelGold,
//En_NumLevelDiamond,
//En_NumLevelUnstop
-(void)numRateView:(En_NumRateView *)numRanView didSelectModel:(En_NumRateCModel *)model
{
//    NSLog(@"title====%@",model.title);
    [UIView animateWithDuration:0.3 animations:^{
        self.conBar.frame = self.conBarORect;
        self.rangeView.frame = self.rangeORect;
        self.rateView.frame = self.rangeORect;
    }];
    self.conBar.rangeBtn.selected = NO;
    self.conBar.rateBtn.selected = NO;
    if (self.level == model.level) return;
    self.level = model.level;
    self.interval = model.interval;
    self.rate = model.rate;
    
}

#pragma mark AVSpeechSynthesizerDelegate
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance
{
//    NSLog(@"didStartSpeechUtterance");
    
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance
{
//    NSLog(@"didFinishSpeechUtterance");
//    self.voice
    WEAKSELF;
    if (!self.isGaming)return;
    if (self.anView.anDatas.count < 10)
    {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.interval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            switch (weakSelf.range) {
                case En_NumRangeZTT:
                {
                    [weakSelf genZeroTOTwelveData];
                }
                    break;
                case En_NumRange1XTX0:
                {
                    [weakSelf gen1XTX0Data];
                }
                    break;
                case En_NumRangeCus:
                {
                    [weakSelf genCusData];
                }
                    break;
                case En_NumDate:
                {
                    [weakSelf genDateData];
                }
                    break;
                default:
                {
                    [weakSelf gen1XTX0Data];
                }
                    break;
            }
        });
    }
    else
    {
        //清空语音队列
        [self.voice stopSpeakingAtBoundary:AVSpeechBoundaryWord];
        self.isGaming = NO;
        self.conBar.playBtn.selected = NO;
    }
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didPauseSpeechUtterance:(AVSpeechUtterance *)utterance
{
//    NSLog(@"didPauseSpeechUtterance");
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didContinueSpeechUtterance:(AVSpeechUtterance *)utterance
{
//    NSLog(@"didContinueSpeechUtterance");
}
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didCancelSpeechUtterance:(AVSpeechUtterance *)utterance
{
//    NSLog(@"didCancelSpeechUtterance");
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer willSpeakRangeOfSpeechString:(NSRange)characterRange utterance:(AVSpeechUtterance *)utterance
{
//    NSLog(@"willSpeakRangeOfSpeechString");
}
-(void)timerBegin:(NSTimer *)timer;
{
    [self.data0ToTwelve removeAllObjects];
    while(self.data0ToTwelve.count < 5)
    {
        int value = arc4random()% 13;
        NSNumber * num00 =  [NSNumber numberWithInt:value];
        BOOL shouldAdd = YES;
        for (NSNumber * num in self.data0ToTwelve)
        {
//            NSLog(@"num==%d---num00=%d",num.intValue,num00.intValue);
            if ([num isEqual:num00])
            {
                shouldAdd = NO;
                break;
            }
        }
        if (shouldAdd == YES)
        {
            [self.data0ToTwelve addObject:num00];
        }
    }
    NSLog(@"count===%lu",(unsigned long)self.data0ToTwelve.count);
    int index = arc4random()% 5;
    [self.optView options:self.data0ToTwelve answers:[NSNumber numberWithInt:index]];
}

#pragma mark En_NumAnswerViewDelegate

-(void)numAnswerView:(En_NumAnswerView *)anView showAnCli:(UIButton *)btn
{
    
}

//移除Timer定时器
-(void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
}
//添加Timer定时器
-(void)addTimer
{
    if (self.timer != nil)return;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(timerBegin:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void)dealloc
{
    NSLog(@"%s",__func__);
}

@end
