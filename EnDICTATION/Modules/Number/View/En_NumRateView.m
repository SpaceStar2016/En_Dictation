//
//  En_NumRateView.m
//  EnDICTATION
//
//  Created by Space Zhong on 2019/4/21.
//  Copyright © 2019年 Space Zhong. All rights reserved.
//

#import "En_NumRateView.h"
#import "En_NumRateCell.h"
#import "En_NumRateCModel.h"
#define NumRateCellWidth (ScreenW / 4.0)
static NSString * En_NumRateCellID = @"En_NumRateCell";
@interface En_NumRateView()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,weak)UICollectionView * cView;
@property(nonatomic,strong)NSMutableArray * datas;
@end
@implementation En_NumRateView
-(NSMutableArray *)datas
{
    if (_datas == nil)
    {
        _datas = [NSMutableArray array];
    }
    return _datas;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = En_GlobalWhite;
        
        UICollectionViewFlowLayout *flowLayoutOne = [[UICollectionViewFlowLayout alloc] init];
        flowLayoutOne.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayoutOne.minimumLineSpacing = 10;//设置最小行间距
        flowLayoutOne.minimumInteritemSpacing = 10;//item间距(最小值)
        flowLayoutOne.sectionInset = UIEdgeInsetsMake(10, 10, 0, 10);
        UICollectionView * cView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0,frame.size.width,frame.size.height) collectionViewLayout:flowLayoutOne];
        cView.dataSource = self;
        cView.delegate = self;
        [cView registerNib:[UINib nibWithNibName:NSStringFromClass([En_NumRateCell class]) bundle:nil] forCellWithReuseIdentifier:En_NumRateCellID];
        cView.showsHorizontalScrollIndicator = NO;
        cView.backgroundColor = En_GlobalWhite;
        [self addSubview:cView];
        self.cView = cView;
        
        [self setupDatas];
    }
    return self;
}

//case En_NumLevelIron:
//{
//    self.interval = 3;
//    self.rate = 0.2;
//}
//break;
//case En_NumLevelBronze:
//{
//    self.interval = 2.5;
//    self.rate = 0.4;
//}
//break;
//case En_NumLevelSilver:
//{
//    self.interval = 2.0;
//    self.rate = 0.5;
//}
//break;
//case En_NumLevelGold:
//{
//    self.interval = 1.5;
//    self.rate = 0.55;
//}
//break;
//case En_NumLevelDiamond:
//{
//    self.interval = 1.0;
//    self.rate = 0.6;
//}
//break;
//case En_NumLevelUnstop:
//{
//    self.interval = 0.5;
//    self.rate = 0.65;
//}
//break;
//
//default:
//{
//    self.interval = 1.0;
//    self.rate = 0.50;
//}
//break;
//}
-(void)setupDatas
{
    En_NumRateCModel * modelmin = [[En_NumRateCModel alloc] init];
    modelmin.interval = 3;
    modelmin.rate = 0.2;
    modelmin.isSelect = NO;
    modelmin.title = @"废铁";
    modelmin.level = En_NumLevelIron;
    
    En_NumRateCModel * model00 = [[En_NumRateCModel alloc] init];
    model00.interval = 2.5;
    model00.rate = 0.4;
    model00.isSelect = NO;
    model00.title = @"青铜";
    model00.level = En_NumLevelBronze;
    
    En_NumRateCModel * model01 = [[En_NumRateCModel alloc] init];
    model01.interval = 2.0;
    model01.rate = 0.5;
    model01.isSelect = YES;
    self.selectedModel = model01;
    model01.title = @"白银";
    model01.level = En_NumLevelSilver;
    
    
    En_NumRateCModel * model02 = [[En_NumRateCModel alloc] init];
    model02.interval = 1.5;
    model02.rate = 0.55;
    model02.isSelect = NO;
    model02.title = @"黄金";
    model02.level = En_NumLevelGold;
    
    En_NumRateCModel * model03 = [[En_NumRateCModel alloc] init];
    model03.interval = 1.0;
    model03.rate = 0.6;
    model03.isSelect = NO;
    model03.title = @"钻石";
    model03.level = En_NumLevelDiamond;
    
    
    En_NumRateCModel * model04 = [[En_NumRateCModel alloc] init];
    model04.interval = 0.5;
    model04.rate = 0.65;
    model04.isSelect = NO;
    model04.title = @"地狱";
    model04.level = En_NumLevelUnstop;
    
    [self.datas addObject:modelmin];
    [self.datas addObject:model00];
    [self.datas addObject:model01];
    [self.datas addObject:model02];
    [self.datas addObject:model03];
    [self.datas addObject:model04];
   
}

#pragma mark UICollectionViewDelegate, UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.datas.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    En_NumRateCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:En_NumRateCellID forIndexPath:indexPath];
    En_NumRateCModel * model = self.datas[indexPath.row];
    cell.model = model;
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    En_NumRateCModel * model = self.datas[indexPath.row];
    for (En_NumRateCModel * m in self.datas)
    {
        m.isSelect = NO;
    }
    model.isSelect = YES;
    self.selectedModel = model;
    if ([self.delegate respondsToSelector:@selector(numRateView:didSelectModel:)]) {
        [self.delegate numRateView:self didSelectModel:model];
    }
    [self.cView reloadData];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake(NumRateCellWidth,35);
}

@end
