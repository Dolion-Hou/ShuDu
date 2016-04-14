//
//  CZGameViewController.m
//  数独
//
//  Created by Dolion.Hou on 16/4/9.
//  Copyright © 2016年 dolion. All rights reserved.
//

#import "CZGameViewController.h"
#import "CZBottomView.h"
#import "CZCollectionView.h"
#import "datasModel.h"
#import "CZAlartView.h"

#define CZHeight 64

@interface CZGameViewController () <CZBottomViewDelegate>

@end

@implementation CZGameViewController

{
    NSString *_once;
    
    UIView *_backgroundView;
    
    CZAlartView *_alartView;
    
    CZBottomView *_bottomView;
    
    CZCollectionView *_collectionView;
    
    NSArray *_datas;
    
    UIView *_bacBigView;
    
    UIButton *_lockBtn;
    
    BOOL _yOrNo;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDatas];
    
    [self setUpUI];
}

-(void)viewDidDisappear:(BOOL)animated{

    _once = nil;

}

- (void)setUpUI{
    
#pragma mark - 加载view
    
    [self loadCZview];
    
#pragma mark - 设置分割线
    
    [self setLine];
    
#pragma mark - 设置时间显示
    
    [self showTimeLable];
    
#pragma mark - 删除
    
    [self deleteVlaue];
    
#pragma mark - 提交数据
    
    [self doneBtn];
    
#pragma mark - 设置功能按钮
    
    [self setBv];
    
    [self beginBtn];
    
#pragma mark - 锁屏Btn - (功能键)
    
//    [self lockBtn];
}

- (void)lockBtn{

    UIButton * btn = [[UIButton alloc] init];
    
    btn.frame = CGRectMake(20, 200, 40, 40);
    
    btn.layer.cornerRadius = 20;
    
    btn.layer.masksToBounds = YES;
    
    btn.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:btn];

}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

//    UITouch * touch = [touches anyObject];
    
//    CGPoint  point = [touch locationInView:[]];

//    _lockBtn.transform = CGAffineTransformMakeTranslation(point.x, point.y);
//    
//    NSLog(@"%lf",point.x);
//
}

- (void)setBv{

    UIView * backV = [[UIView alloc] initWithFrame:CGRectMake(0, CZHeight, self.view.bounds.size.width, self.view.bounds.size.height - 2 * CZHeight)];
    
    backV.backgroundColor = [UIColor grayColor];
    
    backV.alpha = 0.85;
    
    UILabel * lab = [[UILabel alloc] init];
    
    lab.text = @"请点击开始";
    
    [lab sizeToFit];
    
    lab.center = backV.center;
    
    lab.backgroundColor = [UIColor cyanColor];
    
    lab.layer.cornerRadius = 3;
    
    lab.layer.masksToBounds = YES;
    
    [backV addSubview:lab];
    
    _bacBigView = backV;
    
    [self.view addSubview:backV];
    
}

- (void)loadDatas{
    
    if (_datas == nil) {
        
        NSMutableArray *arrM = [NSMutableArray array];
        
        int a = arc4random_uniform(2);
        
        NSArray * arrDa = [NSArray array];
        
        switch (a) {
            case 0:
            {
                NSArray * arrD = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"easy.plist" ofType:nil]];
                
                arrDa = arrD;
            }
                
                break;
                
                case 1:
            {
                
                NSArray * arrD = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"hard.plist" ofType:nil]];
                
                arrDa = arrD;
            }
                
                break;
        }
        
        for (NSDictionary * dict in [arrDa lastObject]) {
            
            datasModel * data = [datasModel datasWithDictionary:dict];
            
            [arrM addObject:data];
        }
        _datas = arrM.copy;
    }
}

- (void)loadCZview{
    
    [self.view setBackgroundColor:[UIColor yellowColor]];
    
    CGSize size = self.view.bounds.size;
    
    CZBottomView * botV = [[CZBottomView alloc] initWithFrame:CGRectMake(0, size.height - CZHeight, size.width, CZHeight)];
    
    botV.delegate = self;
    
    botV.backgroundColor = [UIColor grayColor];
    
    _bottomView = botV;
    
    [self.view addSubview:botV];
    
    //加载collectionview
    CZCollectionView * collview = [[CZCollectionView alloc] initWithData:_datas];
    
    collview.backgroundColor = [UIColor lightGrayColor];
    
    _collectionView = collview;
    
    [self.view addSubview:collview];
}

- (void)showTimeLable{
    
    UILabel * timeLab = [[UILabel alloc] init];
    
    timeLab.frame = CGRectMake(self.view.bounds.size.width - 50 - 100, 80, 100, 25);
    
    timeLab.backgroundColor = [UIColor cyanColor];
    
    timeLab.layer.cornerRadius = 7;
    
    timeLab.layer.masksToBounds = YES;
    
    timeLab.textAlignment = NSTextAlignmentCenter;
    
    timeLab.text = [NSString stringWithFormat:@"00:00:00"];
    
    [self.view addSubview:timeLab];
}

- (void)beginBtn{
    
    UIButton * begin = [[UIButton alloc] init];
    
    begin.frame = CGRectMake(50, 80, 75, 25);
    
    begin.selected = YES;
    
    begin.layer.cornerRadius = 7;
    
    begin.layer.masksToBounds = YES;
    
    begin.backgroundColor = [UIColor cyanColor];
    
    [begin setTitle:@"开始" forState:UIControlStateNormal];
    
    [begin addTarget:self action:@selector(beginNow:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:begin];
}

- (void)doneBtn{
    
    UIButton * doneBtn = [[UIButton alloc] init];
    
    doneBtn.frame = CGRectMake(self.view.bounds.size.width - 125, self.view.bounds.size.height - CZHeight - 50, 75, 25);
    
    doneBtn.layer.cornerRadius = 7;
    
    doneBtn.layer.masksToBounds = YES;
    
    doneBtn.backgroundColor = [UIColor cyanColor];
    
    [doneBtn setTitle:@"提交" forState:UIControlStateNormal];
    
    [doneBtn addTarget:self action:@selector(checkDatas) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:doneBtn];
}

- (void)deleteVlaue{
    
    UIButton * deleteBtn = [[UIButton alloc] init];
    
    deleteBtn.frame = CGRectMake(50, self.view.bounds.size.height - CZHeight - 50, 75, 25);
    
    deleteBtn.layer.cornerRadius = 7;
    
    deleteBtn.layer.masksToBounds = YES;
    
    deleteBtn.backgroundColor = [UIColor cyanColor];
    
    [deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    
    [deleteBtn addTarget:self action:@selector(delete) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:deleteBtn];
}

- (void)setLine{
    
    CGFloat width = self.view.bounds.size.width;
    
    for (NSInteger i = 1; i < 10; i++) {
        
        if (i % 3 == 0) {
            
            [self loadLineFrame:CGRectMake(0, 139 + (39.44 + 2) * i - 2, width, 2)];
        }
    }
    //hTvL 1
    [self loadLineFrame:CGRectMake(0,64 + 75 - 2,width, 2)];
    
    //vLv
    for (NSInteger i = 0; i < 10; i++) {
        
        if (i % 3 == 0) {
            
            [self loadLineFrame:CGRectMake(0 + (39.44 + 2) * i, 139, 2, width)];
        }
    }
}

- (void)loadLineFrame:(CGRect)rect{
    
    UIView * lineView = [[UIView alloc] initWithFrame:rect];
    
    lineView.backgroundColor = [UIColor purpleColor];
    
    [self.view addSubview:lineView];
}

#pragma mark - 代理方法的实现

- (void)sendVlaue:(UIButton *)btn{
    
    _collectionView.btn = btn;
}

#pragma mark - 开始

- (void)beginNow:(UIButton *)btn{
    
    [self bottomViewBtnStyle:YES];
    
    [_bacBigView removeFromSuperview];
    
    if ([btn.titleLabel.text isEqualToString:@"开始"]) {
        
        [btn setTitle:@"暂停" forState:UIControlStateNormal];
        
        btn.backgroundColor = [UIColor orangeColor];
        
        [self bottomViewBtnStyle:YES];
    }
    else{
        
        [btn setTitle:@"开始" forState:UIControlStateNormal];
        
        btn.backgroundColor = [UIColor cyanColor];
        
        [self bottomViewBtnStyle:NO];
    }
    
    if (_once == nil) {
       
        [_collectionView setCellUserInteractionEnabled];
        
        _once = @"yes";
    }

    if ([btn.titleLabel.text isEqualToString:@"开始"]) {
        
        _yOrNo = YES;
    }
    else{
    
        _yOrNo = NO;
    }
}

- (void)bottomViewBtnStyle:(BOOL)yOrN{
    
    for (id obj in _bottomView.subviews) {
        
        if ([obj isKindOfClass:[UIButton class]]) {
            
            UIButton * someBtn = obj;
            
            someBtn.enabled = yOrN;
        }
    }
}

#pragma mark - 删除功能
- (void)delete{
    
    [_collectionView deleteLabValue];
}

#pragma mark - 提交数据
- (void)checkDatas{
    
    NSArray * arrays = [_collectionView datasWriteToArrays];
    //没有输入完
    if (arrays.count == 0) {
        
        [self tipViewWithString:@"尚有空白项"];
    }
    else{
        
        for (NSMutableArray * arr in arrays) {
            
            for (NSInteger i = 0 ; i < arr.count -1 ; i++) {
                
                for (NSInteger j = i; j < arr.count - i -1 ; j++) {
                    
                    if ([arr[i] description].intValue == [arr[j + 1] description].intValue) {
                        //有重复错误
                        [self tipViewWithString:@"有重复错误"];
                        
                        return;
                    }
                }
            }
        }
        //全部正确
        [self tipViewWithString:@"顺利通关"];
    }
}

#pragma mark - 提示框

- (void)tipViewWithString:(NSString *)str{
    
    UIView * backgroundView = [[UIView alloc] initWithFrame:self.view.bounds];
    
    backgroundView.backgroundColor = [UIColor darkGrayColor];
    
    backgroundView.alpha = 0.3;
    
    _backgroundView = backgroundView;
    
    [self.view addSubview:backgroundView];

    CZAlartView * alartView = [[CZAlartView alloc] initWithString:str];
    
    _alartView = alartView;
    
        [self.view addSubview:alartView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [UIView animateWithDuration:2 animations:^{
        
        _backgroundView.alpha = 0;
        
        _alartView.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        [_backgroundView removeFromSuperview];
        
        [_alartView removeFromSuperview];
    }];
}

- (void)tipAlartView{
    
    if (_yOrNo) {
        
        [self tipViewWithString:@"请点击开始"];
        
        [UIView animateWithDuration:2 animations:^{
            
            _backgroundView.alpha = 0;
            
            _alartView.alpha = 0;
            
        } completion:^(BOOL finished) {
            
            [_backgroundView removeFromSuperview];
            
            [_alartView removeFromSuperview];
        }];
    }
}







@end
