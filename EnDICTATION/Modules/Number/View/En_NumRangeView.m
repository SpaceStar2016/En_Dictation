//
//  En_NumRangeView.m
//  EnDICTATION
//
//  Created by Space Zhong on 2019/4/21.
//  Copyright © 2019年 Space Zhong. All rights reserved.
//

#import "En_NumRangeView.h"
#import "En_NumRangeCell.h"
#import "En_NumRangeCModel.h"

#define NumRangeCellWidth (ScreenW / 4.0)
#define NumRangeCellHeight (50)
static NSString * En_NumRangeCellID = @"En_NumRangeCell";


@interface En_NumRangeView()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,weak)UICollectionView * cView;
@property(nonatomic,strong)NSMutableArray * datas;
@end
@implementation En_NumRangeView

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
        
        UICollectionViewFlowLayout *flowLayoutOne = [[UICollectionViewFlowLayout alloc] init];
        flowLayoutOne.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayoutOne.minimumLineSpacing = 5;//设置最小行间距
        flowLayoutOne.minimumInteritemSpacing = 10;//item间距(最小值)
        flowLayoutOne.sectionInset = UIEdgeInsetsMake(10,10,0,10);
        UICollectionView * cView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0,frame.size.width,frame.size.height) collectionViewLayout:flowLayoutOne];
        cView.dataSource = self;
        cView.delegate = self;
        [cView registerNib:[UINib nibWithNibName:NSStringFromClass([En_NumRangeCell class]) bundle:nil] forCellWithReuseIdentifier:En_NumRangeCellID];
        cView.showsHorizontalScrollIndicator = NO;
        cView.backgroundColor = En_GlobalWhite;
        [self addSubview:cView];
        self.cView = cView;
        
        [self setupDatas];
    }
    return self;
}

-(void)setupDatas
{
    En_NumRangeCModel * model00 = [[En_NumRangeCModel alloc] init];
    model00.isSelect = NO;
    model00.title = @"0 ~ 12";
    model00.range = En_NumRangeZTT;
    
    En_NumRangeCModel * model01 = [[En_NumRangeCModel alloc] init];
    model01.isSelect = YES;
    self.selectedModel = model01;
    model01.title = @"1X ~ X0";
    model01.range = En_NumRange1XTX0;
    
    En_NumRangeCModel * model02 = [[En_NumRangeCModel alloc] init];
    model02.isSelect = NO;
    model02.title = @"自定义";
    model02.range = En_NumRangeCus;
    
    En_NumRangeCModel * model03 = [[En_NumRangeCModel alloc] init];
    model03.isSelect = NO;
    model03.title = @"日期";
    model03.range = En_NumDate;

    [self.datas addObject:model00];
    [self.datas addObject:model01];
    [self.datas addObject:model02];
    [self.datas addObject:model03];

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
    
    En_NumRangeCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:En_NumRangeCellID forIndexPath:indexPath];
    En_NumRangeCModel * model = self.datas[indexPath.row];
    cell.model = model;
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    En_NumRangeCModel * model = self.datas[indexPath.row];
    for (En_NumRangeCModel * m in self.datas)
    {
        m.isSelect = NO;
    }
    model.isSelect = YES;
    self.selectedModel = model;
    if ([self.delegate respondsToSelector:@selector(numRangeView:didSelectModel:)]) {
        [self.delegate numRangeView:self didSelectModel:model];
    }
    [self.cView reloadData];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

    return CGSizeMake(NumRangeCellWidth,35);
}

@end
