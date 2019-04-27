//
//  En_NumAnswerView.m
//  EnDICTATION
//
//  Created by Space Zhong on 2019/4/21.
//  Copyright © 2019年 Space Zhong. All rights reserved.
//

#import "En_NumAnswerView.h"
#import "En_NumAnCell.h"
#import "En_NumAnModel.h"
#define NumAnCellWidth (ScreenW / 7)
#define NumAnCellHeight (50)
static NSString * En_NumAnCellID = @"En_NumAnCell";
@interface En_NumAnswerView()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,weak)UICollectionView * cAnView;
@property(nonatomic,weak)UILabel * cAnPromptLabel;
@property(nonatomic,weak)UILabel * cYourOptPromptLabel;
@property(nonatomic,weak)UICollectionView * cYourOptView;
@property(nonatomic,weak)UIButton * cButton;
@property(nonatomic,strong)NSMutableArray * yourOptDatas;
@end

@implementation En_NumAnswerView
-(NSMutableArray *)anDatas
{
    if (_anDatas == nil)
    {
        _anDatas = [NSMutableArray array];
    }
    return _anDatas;
}
-(NSMutableArray *)yourOptDatas
{
    if (_yourOptDatas == nil)
    {
        _yourOptDatas = [NSMutableArray array];
    }
    return _yourOptDatas;
}


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        
        
        UIButton * cButton = [[UIButton alloc] initWithFrame:CGRectMake(10,0,30,frame.size.height * 0.5 - 5)];
        [cButton setTitle:@"Show" forState:UIControlStateNormal];
        [cButton addTarget:self action:@selector(show:) forControlEvents:UIControlEventTouchUpInside];
        [cButton setImage:[UIImage imageNamed:@"En_ShowAn"] forState:UIControlStateNormal];
        [cButton setImage:[UIImage imageNamed:@"En_HiddenAn"] forState:UIControlStateSelected];
        //En_HiddenAn
        [self addSubview:cButton];
        self.cButton = cButton;
//        self.cButton.backgroundColor = SPSRandomColor;
        
        UICollectionViewFlowLayout *flowLayoutOne = [[UICollectionViewFlowLayout alloc] init];
        flowLayoutOne.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayoutOne.minimumLineSpacing = 5;//设置最小行间距
        flowLayoutOne.minimumInteritemSpacing = 5;//item间距(最小值)
        flowLayoutOne.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        UICollectionView * cAnView = [[UICollectionView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(cButton.frame),0,frame.size.width - CGRectGetMaxX(cButton.frame),frame.size.height * 0.5 - 5) collectionViewLayout:flowLayoutOne];
        cAnView.tag = 0;
        cAnView.backgroundColor = En_GlobalWhite;
        cAnView.dataSource = self;
        cAnView.delegate = self;
        [cAnView registerNib:[UINib nibWithNibName:NSStringFromClass([En_NumAnCell class]) bundle:nil] forCellWithReuseIdentifier:En_NumAnCellID];
        cAnView.showsHorizontalScrollIndicator = NO;
        cAnView.hidden = YES;
        [self addSubview:cAnView];
        self.cAnView = cAnView;
        
        UILabel * cAnPromptLabel = [[UILabel alloc] init];
        cAnPromptLabel.frame = self.cAnView.frame;
        cAnPromptLabel.textColor = En_GlobalTextGrey;
        cAnPromptLabel.font = [UIFont systemFontOfSize:18];
        cAnPromptLabel.textAlignment = NSTextAlignmentCenter;
        cAnPromptLabel.text = @"Answersssssss";
        cAnPromptLabel.alpha = 0.35;
        [self addSubview:cAnPromptLabel];
        self.cAnPromptLabel = cAnPromptLabel;
        
        
        UICollectionViewFlowLayout *flowLayoutTwo = [[UICollectionViewFlowLayout alloc] init];
        flowLayoutTwo.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayoutTwo.minimumLineSpacing = 5;//设置最小行间距
        flowLayoutTwo.minimumInteritemSpacing = 5;//item间距(最小值)
        flowLayoutTwo.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        UICollectionView * cYourOptView = [[UICollectionView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(cButton.frame),CGRectGetMaxY(cAnView.frame),frame.size.width - CGRectGetMaxX(cButton.frame),frame.size.height * 0.5 - 5) collectionViewLayout:flowLayoutTwo];
        cYourOptView.tag = 1;
        cYourOptView.backgroundColor = En_GlobalWhite;
        cYourOptView.dataSource = self;
        cYourOptView.delegate = self;
        [cYourOptView registerNib:[UINib nibWithNibName:NSStringFromClass([En_NumAnCell class]) bundle:nil] forCellWithReuseIdentifier:En_NumAnCellID];
        cYourOptView.showsHorizontalScrollIndicator = NO;
        [self addSubview:cYourOptView];
        self.cYourOptView = cYourOptView;
        
        UILabel * cYourOptPromptLabel = [[UILabel alloc] init];
        cYourOptPromptLabel.frame = self.cYourOptView.frame;
        cYourOptPromptLabel.textColor = En_GlobalTextGrey;
        cYourOptPromptLabel.font = [UIFont systemFontOfSize:18];
        cYourOptPromptLabel.textAlignment = NSTextAlignmentCenter;
        cYourOptPromptLabel.text = @"Your Answersssss";
        cYourOptPromptLabel.alpha = 0.35;
        [self addSubview:cYourOptPromptLabel];
        self.cYourOptPromptLabel = cYourOptPromptLabel;

//        cAnView.backgroundColor = SPSRandomColor;
//        cYourOptView.backgroundColor = SPSRandomColor;
//        [self setupDatas];
    }
    return self;
}

-(void)setupDatas
{
    En_NumAnModel * model00 = [[En_NumAnModel alloc] init];
    model00.title = @"13";
    
    En_NumAnModel * model01 = [[En_NumAnModel alloc] init];
    model01.title = @"30";
    
    
    En_NumAnModel * model02 = [[En_NumAnModel alloc] init];
    model02.title = @"50";
    
    [self.anDatas addObject:model00];
    [self.anDatas addObject:model01];
    [self.anDatas addObject:model02];
    [self.anDatas addObject:model01];
    [self.anDatas addObject:model02];
    [self.anDatas addObject:model00];
    [self.anDatas addObject:model01];
    [self.anDatas addObject:model02];
    [self.anDatas addObject:model01];
    [self.anDatas addObject:model02];
    
    
    [self.yourOptDatas addObject:model00];
    [self.yourOptDatas addObject:model01];
    [self.yourOptDatas addObject:model02];
    [self.yourOptDatas addObject:model01];
    [self.yourOptDatas addObject:model02];
    [self.yourOptDatas addObject:model00];
    [self.yourOptDatas addObject:model01];
    [self.yourOptDatas addObject:model02];
    [self.yourOptDatas addObject:model01];
    [self.yourOptDatas addObject:model02];

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.tag == 0)
    {
        [self.cYourOptView setContentOffset:scrollView.contentOffset];
    }
    else
    {
        [self.cAnView setContentOffset:scrollView.contentOffset];
    }
}

-(void)addAnData:(En_NumAnModel *)num
{
    En_NumAnModel * model = [[En_NumAnModel alloc] init];
    model.title = num.title;
    [self.anDatas addObject:model];
    [self.cAnView reloadData];
    if (!self.cAnView.hidden && self.anDatas.count > 0)
    {
        self.cAnPromptLabel.hidden = YES;
    }
    else
    {
        self.cAnPromptLabel.hidden = NO;
    }
}

-(void)addYourOptData:(En_NumAnModel *)num
{
    En_NumAnModel * model = [[En_NumAnModel alloc] init];
    model.title = num.title;
    [self.yourOptDatas addObject:model];
    [self.cYourOptView reloadData];
    self.cYourOptPromptLabel.hidden  = YES;
    
}
-(void)addAnDate:(NSString *)date
{
    En_NumAnModel * model = [[En_NumAnModel alloc] init];
    model.title = date;
    [self.anDatas addObject:model];
    [self.cAnView reloadData];
    if (!self.cAnView.hidden && self.anDatas.count > 0)
    {
        self.cAnPromptLabel.hidden = YES;
    }
    else
    {
        self.cAnPromptLabel.hidden = NO;
    }
}
-(void)addYourOptDate:(NSString *)date
{
    En_NumAnModel * model = [[En_NumAnModel alloc] init];
    model.title = date;
    [self.yourOptDatas addObject:model];
    [self.cYourOptView reloadData];
    self.cYourOptPromptLabel.hidden  = YES;
}
-(void)clear
{
    [self.anDatas removeAllObjects];
    [self.yourOptDatas removeAllObjects];
    [self.cAnView reloadData];
    [self.cYourOptView reloadData];
    self.cAnPromptLabel.hidden = NO;
    self.cYourOptPromptLabel.hidden = NO;
}

#pragma mark UICollectionViewDelegate, UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView.tag == 0)
    {
        return self.anDatas.count;
    }
    else
    {
        return self.yourOptDatas.count;
    }
    
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    En_NumAnCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:En_NumAnCellID forIndexPath:indexPath];
    if (collectionView.tag == 0)
    {
        En_NumAnModel * model = self.anDatas[indexPath.row];
        cell.model = model;
    }
    else
    {
        En_NumAnModel * model = self.yourOptDatas[indexPath.row];
        cell.model = model;
    }
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat textW = NumAnCellWidth;
    if (collectionView.tag == 0)
    {
        En_NumAnModel * anModel = self.anDatas[indexPath.row];
        textW = [En_Untils calculateRowWidth:anModel.title fontSize:17] + 15;
        NSLog(@"title===%@",anModel.title);
        NSLog(@"textW===%f",textW);
        
    }
    else
    {
        En_NumAnModel * YanModel = self.yourOptDatas[indexPath.row];
        textW = [En_Untils calculateRowWidth:YanModel.title fontSize:17] + 15;

    }
    
    if (textW < NumAnCellWidth)
    {
        textW = NumAnCellWidth;
    }
    
    return CGSizeMake(textW,collectionView.height);
}

-(void)show:(UIButton *)btn
{
    btn.selected = !btn.selected;
    self.cAnView.hidden = !btn.selected;
    if (!self.cAnView.hidden && self.anDatas.count > 0) {
        self.cAnPromptLabel.hidden = YES;
    }
    else
    {
       self.cAnPromptLabel.hidden = NO;
    }
    
    if ([self.delegate respondsToSelector:@selector(numAnswerView:showAnCli:)]) {
        [self.delegate numAnswerView:self showAnCli:btn];
    }
}

@end
