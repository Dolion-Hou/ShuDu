//
//  CZHomeCollectionVC.m
//  数独
//
//  Created by Dolion.Hou on 16/3/20.
//  Copyright © 2016年 dolion. All rights reserved.
//

#import "CZHomeVC.h"
#import "CZGameViewController.h"

@implementation CZHomeVC

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self setBaseD];
}

- (void)setBaseD{
    
    self.title = @"首页";

    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    [self addBtn];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:nil];
}

- (void)addBtn{

    UIButton * btn = [[UIButton alloc] init];
    
    CGRect rect = btn.frame;
    
    rect.size = CGSizeMake(50, 50);
    
    btn.frame = rect;
    
    btn.center = self.view.center;
    
    btn.backgroundColor = [UIColor orangeColor];
    
    [btn setTitle:@"数独" forState:UIControlStateNormal];
    
    btn.layer.cornerRadius = 15;
    
    btn.layer.masksToBounds = YES;
    
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(jumpToGame) forControlEvents:UIControlEventTouchUpInside];
}

- (void)jumpToGame{
    
    CZGameViewController * vic = [[CZGameViewController alloc]init];
    
    [self.navigationController pushViewController:vic animated:YES];
}

@end
















