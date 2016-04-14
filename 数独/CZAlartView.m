//
//  CZAlartView.m
//  数独
//
//  Created by Dolion.Hou on 16/4/11.
//  Copyright © 2016年 dolion. All rights reserved.
//

#import "CZAlartView.h"

@implementation CZAlartView

{

    NSString *_str;

}

- (instancetype)initWithString:(NSString *)str
{
    self = [super initWithFrame:CGRectMake(100, 300, [UIScreen mainScreen].bounds.size.width - 200, 100)];
    if (self) {
        
        _str = str;
        
        [self setUpUI];
        
    }
    return self;
}

- (void)setUpUI{

    self.backgroundColor = [UIColor grayColor];
    
    self.layer.cornerRadius = 15;
    
    self.layer.masksToBounds = YES;
    
    UILabel * lab = [[UILabel alloc] initWithFrame:CGRectMake(20,(self.bounds.size.height - 50) / 2, self.bounds.size.width - 40, 50)];
    
    lab.text = _str;
    
    [lab setTextAlignment:NSTextAlignmentCenter];
    
    [self addSubview:lab];

}

@end
