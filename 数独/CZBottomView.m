//
//  CZBottomView.m
//  数独
//
//  Created by Dolion.Hou on 16/4/9.
//  Copyright © 2016年 dolion. All rights reserved.
//

#import "CZBottomView.h"
#import "CZAlartView.h"

@implementation CZBottomView

{

    UIView *_backgroundView;
    
    UIView *_alartView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
    }

    return self;
}

- (void)layoutSubviews{

    [super layoutSubviews];
    
    [self setUpUI];
}


#pragma mark - 设置UI
- (void)setUpUI{

    for (NSInteger i = 0; i < 10 ; i++) {
        
        UIButton * btn = [[UIButton alloc] init];
        
        btn.frame = CGRectMake((39.44 + 2) * i + 2, (self.bounds.size.height - 39.44) / 2, 39.44, 39.44);
        
        btn.backgroundColor = [UIColor orangeColor];
        
        [btn setTitle:[NSString stringWithFormat:@"%ld",i + 1] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.layer.cornerRadius = 5;
        
        btn.layer.masksToBounds = YES;
        
        btn.enabled = NO;
        
        [self addSubview:btn];
    }
}

- (void)changeValue:(UIButton *)btn{

    if ([self.delegate respondsToSelector:@selector(sendVlaue:)]) {
        
        [self.delegate sendVlaue:btn];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    if ([self.delegate respondsToSelector:@selector(tipAlartView)]) {
        
        [self.delegate tipAlartView];
    }
}


@end
