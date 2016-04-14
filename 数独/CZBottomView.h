//
//  CZBottomView.h
//  数独
//
//  Created by Dolion.Hou on 16/4/9.
//  Copyright © 2016年 dolion. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CZBottomViewDelegate <NSObject>

- (void)sendVlaue:(UIButton *)btn;

- (void)tipAlartView;

@end

@interface CZBottomView : UIView

@property (nonatomic,weak) id <CZBottomViewDelegate> delegate;

@end
