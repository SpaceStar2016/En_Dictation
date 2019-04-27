//
//  En_NumOptView.m
//  EnDICTATION
//
//  Created by Space Zhong on 2019/4/21.
//  Copyright © 2019年 Space Zhong. All rights reserved.
//

#import "En_NumOptView.h"
#import "En_NumOptCell.h"
#import "En_NumOptCModel.h"
#import "En_NumAnswerView.h"
#import "En_NumAnModel.h"
static NSString * En_NumOptCellID = @"En_NumOptCell";
@interface En_NumOptView()<UITableViewDelegate,UITableViewDataSource>
//@property(nonatomic,strong)uita * model;
@property(nonatomic,weak)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * datas;
@property(nonatomic,strong)NSNumber * answer;
@end
@implementation En_NumOptView
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
        
        self.backgroundColor = SPSRandomColor;
        //初始化
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0,frame.size.width, frame.size.height)];
        tableView.delegate = self;
        tableView.dataSource = self;
        [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([En_NumOptCell class]) bundle:nil] forCellReuseIdentifier:En_NumOptCellID];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:tableView];
        self.tableView = tableView;
        [self testDatas];
    }
    return self;
}

-(void)testDatas
{
    
    En_NumOptCModel * model00 = [[En_NumOptCModel alloc] init];
    model00.title = @"NUMBER";
    En_NumOptCModel * model01 = [[En_NumOptCModel alloc] init];
    model01.title = @"NUMBER";
    En_NumOptCModel * model02 = [[En_NumOptCModel alloc] init];
    model02.title = @"NUMBER";
    En_NumOptCModel * model03 = [[En_NumOptCModel alloc] init];
    model03.title = @"NUMBER";
    En_NumOptCModel * model04 = [[En_NumOptCModel alloc] init];
    model04.title = @"NUMBER";
    [self.datas addObject:model00];
    [self.datas addObject:model01];
    [self.datas addObject:model02];
    [self.datas addObject:model03];
    [self.datas addObject:model04];
}

//-(void)setDatas:(NSMutableArray *)datas
//{
//    _datas = datas;
//    [self.tableView reloadData];
//}

-(void)options:(NSMutableArray <En_NumOptCModel*> *)opts answers:(NSNumber*)index
{
    [self.datas removeAllObjects];
    for (En_NumOptCModel * optM in opts) {
        En_NumOptCModel * model = [[En_NumOptCModel alloc] init];
        model.title = optM.title;
        [self.datas addObject:model];
    }
    self.answer = index;
    [self.tableView reloadData];
}

//常用的代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.datas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    En_NumOptCell *cell = [tableView dequeueReusableCellWithIdentifier:En_NumOptCellID];
    En_NumOptCModel * model = self.datas[indexPath.row];
    cell.model = model;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    En_NumOptCModel * model = self.datas[indexPath.row];
    En_NumAnModel * anModel = [[En_NumAnModel alloc] init];
    anModel.title = model.title;
    [self.anView addYourOptData:anModel];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return tableView.height / self.datas.count;
}

@end
