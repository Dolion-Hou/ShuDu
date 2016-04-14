//
//  CZCollectionView.m
//  数独
//
//  Created by Dolion.Hou on 16/4/9.
//  Copyright © 2016年 dolion. All rights reserved.
//

#import "CZCollectionView.h"
#import "CZPrepareLayout.h"
#import "datasModel.h"
static NSString * ID = @"collectionViewCell";
@interface CZCollectionView () <UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation CZCollectionView{
    
    UILabel *_lab;
    
    NSArray *_datas;
    
    UICollectionViewCell *_cell;
}


- (instancetype)initWithData:(NSArray *)data{
    
    self = [super initWithFrame:CGRectMake(0, 64,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height - 2 * 64) collectionViewLayout:[[CZPrepareLayout alloc] init]];
    
    if (self) {
        
        _datas = data;
        
        self.dataSource = self;
        
        self.delegate = self;
        
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    }
    return self;
}


#pragma mark - 数据方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _datas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    UILabel * lab = [[UILabel alloc] init];
    
    lab.frame = cell.contentView.bounds;
    
    datasModel * model = _datas[indexPath.item];
    
    lab.text = model.num;
    
//#pragma mark - 演示问题代码
//    
//    //-----------------------------------------------
//    
//    
//    if ([model.num length] > 0 || model.num == nil) {
//        
//        cell.backgroundColor = [UIColor redColor];
//        
//    }
//    
//    //-----------------------------------------------
    
    lab.textAlignment = NSTextAlignmentCenter;
    
    [cell.contentView addSubview:lab];
    
    cell.tag = indexPath.row;
        
    cell.layer.cornerRadius = 5;
    
    cell.layer.masksToBounds = YES;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    for (UICollectionViewCell * item in self.subviews) {
#pragma mark - 改变cell中文字的颜色
        
        if (item.tag == indexPath.row) {
            
            _cell.backgroundColor = [UIColor magentaColor];
            
            _cell = item;
            
            item.backgroundColor = [UIColor orangeColor];
            
            for (id obj in item.contentView.subviews) {
                
                if ([obj isKindOfClass:[UILabel class]]) {
                    
                    UILabel * lab = obj;
                    
                    _lab = lab;
                }
            }
        }
    }
}

- (void)setBtn:(UIButton *)btn{
    
    _btn = btn;
    
    _lab.text = _btn.titleLabel.text;
}

- (void)deleteLabValue{
    
    _lab.text = nil;
}
//设置cell的setCellUserInteractionEnabled

- (void)setCellUserInteractionEnabled{
    
    for (id obj in self.subviews) {
        
        if ([obj isKindOfClass:[UICollectionViewCell class]]) {
            
            UICollectionViewCell * cell = obj;
            
            for (id objs in cell.contentView.subviews) {
                
                if ([objs isKindOfClass:[UILabel class]]) {
                    
                    UILabel * lab = objs;
                    
                    if (![lab.text isEqualToString:@""]) {
                    //无法选中cell的颜色设置
                        cell.backgroundColor = [UIColor cyanColor];
                        
                        cell.userInteractionEnabled = NO;
                    }
                    else{
                        
                        cell.backgroundColor = [UIColor magentaColor];
                    }
                }
            }
        }
    }
}

- (NSArray *)datasWriteToArrays{
    
    NSMutableArray * arrays = [NSMutableArray array];
#pragma mark - 横向数组
    NSMutableArray * arrH1 = [NSMutableArray array];
    NSMutableArray * arrH2 = [NSMutableArray array];
    NSMutableArray * arrH3 = [NSMutableArray array];
    NSMutableArray * arrH4 = [NSMutableArray array];
    NSMutableArray * arrH5 = [NSMutableArray array];
    NSMutableArray * arrH6 = [NSMutableArray array];
    NSMutableArray * arrH7 = [NSMutableArray array];
    NSMutableArray * arrH8 = [NSMutableArray array];
    NSMutableArray * arrH9 = [NSMutableArray array];
#pragma mark - 纵向数组
    NSMutableArray * arrV1 = [NSMutableArray array];
    NSMutableArray * arrV2 = [NSMutableArray array];
    NSMutableArray * arrV3 = [NSMutableArray array];
    NSMutableArray * arrV4 = [NSMutableArray array];
    NSMutableArray * arrV5 = [NSMutableArray array];
    NSMutableArray * arrV6 = [NSMutableArray array];
    NSMutableArray * arrV7 = [NSMutableArray array];
    NSMutableArray * arrV8 = [NSMutableArray array];
    NSMutableArray * arrV9 = [NSMutableArray array];
#pragma mark - 宫格数组
    NSMutableArray * arr1 = [NSMutableArray array];
    NSMutableArray * arr2 = [NSMutableArray array];
    NSMutableArray * arr3 = [NSMutableArray array];
    NSMutableArray * arr4 = [NSMutableArray array];
    NSMutableArray * arr5 = [NSMutableArray array];
    NSMutableArray * arr6 = [NSMutableArray array];
    NSMutableArray * arr7 = [NSMutableArray array];
    NSMutableArray * arr8 = [NSMutableArray array];
    NSMutableArray * arr9 = [NSMutableArray array];
    
    for (id obj in self.subviews) {
        
        if ([obj isKindOfClass:[UICollectionViewCell class]]) {
            
            UICollectionViewCell * item = obj;
            
            UILabel * lab = [[UILabel alloc] init];
            //获取cell中的lable
            for (id obj1 in item.contentView.subviews) {
                
                if ([obj1 isKindOfClass:[UILabel class]]) {
                    
                    lab = obj1;
                }
            }
            NSString * str = lab.text;
#pragma mark - 没有输入完
            if (str == nil || [str isEqualToString:@""] ) {
                
                return 0;
            }
            else{
                
                if (item.tag < 9) {
                    //横向数组的初始化
                    [arrH1 addObject:str];
                }
                if (item.tag < 18 & item.tag >8) {
                    [arrH2 addObject:str];
                }
                if (item.tag > 17 & item.tag <27) {
                    [arrH3 addObject:str];
                }
                if (item.tag > 26 & item.tag < 36) {
                    [arrH4 addObject:str];
                }
                if (item.tag > 35 & item.tag < 45) {
                    [arrH5 addObject:str];
                }
                if (item.tag > 44 & item.tag < 54) {
                    [arrH6 addObject:str];
                }
                if (item.tag > 53 & item.tag < 63) {
                    [arrH7 addObject:str];
                }
                if (item.tag > 62 & item.tag < 72) {
                    [arrH8 addObject:str];
                }
                if (item.tag > 71) {
                    [arrH9 addObject:str];
                }
                //纵向数组的初始化
                if (item.tag % 9 == 0) {
                    [arrV1 addObject:str];
                }
                if ((item.tag - 1) % 9 == 0) {
                    [arrV2 addObject:str];
                }
                if ((item.tag - 2) % 9 == 0) {
                    [arrV3 addObject:str];
                }
                if ((item.tag - 3) % 9 == 0) {
                    [arrV4 addObject:str];
                }
                if ((item.tag - 4) % 9 == 0) {
                    [arrV5 addObject:str];
                }
                if ((item.tag - 5) % 9 == 0) {
                    [arrV6 addObject:str];
                }
                if ((item.tag - 6) % 9 == 0) {
                    [arrV7 addObject:str];
                }
                if ((item.tag - 7) % 9 == 0) {
                    [arrV8 addObject:str];
                }
                if ((item.tag - 8) % 9 == 0) {
                    [arrV9 addObject:str];
                }
                //宫格数组初始化
                if ((item.tag % 9 == 0 || item.tag % 9 == 1 || item.tag % 9 == 2) & (item.tag / 9 < 3) ) {
                    [arr1 addObject:str];
                }
                if ((item.tag % 9 == 3 || item.tag % 9 == 4 || item.tag % 9 == 5) & (item.tag / 9 < 3) ) {
                    [arr2 addObject:str];
                }
                if ((item.tag % 9 == 6 || item.tag % 9 == 7 || item.tag % 9 == 8) & (item.tag / 9 < 3) ) {
                    [arr3 addObject:str];
                }
                //            -------
                if ((item.tag % 9 == 0 || item.tag % 9 == 1 || item.tag % 9 == 2) & (item.tag / 9 < 6) &(item.tag / 9 > 2) ) {
                    [arr4 addObject:str];
                }
                if ((item.tag % 9 == 3 || item.tag % 9 == 4 || item.tag % 9 == 5) & (item.tag / 9 < 6) &(item.tag / 9 > 2) ) {
                    [arr5 addObject:str];
                }
                if ((item.tag % 9 == 6 || item.tag % 9 == 7 || item.tag % 9 == 8) & (item.tag / 9 < 6) &(item.tag / 9 > 2) ) {
                    [arr6 addObject:str];
                }
                //            -------
                if ((item.tag % 9 == 0 || item.tag % 9 == 1 || item.tag % 9 == 2) &(item.tag / 9 > 5) ) {
                    [arr7 addObject:str];
                }
                if ((item.tag % 9 == 3 || item.tag % 9 == 4 || item.tag % 9 == 5) &(item.tag / 9 > 5) ) {
                    [arr8 addObject:str];
                }
                if ((item.tag % 9 == 6 || item.tag % 9 == 7 || item.tag % 9 == 8) &(item.tag / 9 > 5) ) {
                    [arr9 addObject:str];
                }
            }
        }
    }
    //添加局部数组到总数组中
    [arrays addObject:arrH1];
    [arrays addObject:arrH2];
    [arrays addObject:arrH3];
    [arrays addObject:arrH4];
    [arrays addObject:arrH5];
    [arrays addObject:arrH6];
    [arrays addObject:arrH7];
    [arrays addObject:arrH8];
    [arrays addObject:arrH9];
    
    [arrays addObject:arrV1];
    [arrays addObject:arrV2];
    [arrays addObject:arrV3];
    [arrays addObject:arrV4];
    [arrays addObject:arrV5];
    [arrays addObject:arrV6];
    [arrays addObject:arrV7];
    [arrays addObject:arrV8];
    [arrays addObject:arrV9];
    
    [arrays addObject:arr1];
    [arrays addObject:arr2];
    [arrays addObject:arr3];
    [arrays addObject:arr4];
    [arrays addObject:arr5];
    [arrays addObject:arr6];
    [arrays addObject:arr7];
    [arrays addObject:arr8];
    [arrays addObject:arr9];
    
    return arrays.copy;
}

@end
