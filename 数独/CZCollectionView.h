//
//  CZCollectionView.h
//  数独
//
//  Created by Dolion.Hou on 16/4/9.
//  Copyright © 2016年 dolion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CZCollectionView : UICollectionView

@property (nonatomic, strong) UIButton * btn;

- (void)deleteLabValue;

- (instancetype)initWithData:(NSArray *)data;

- (NSArray *)datasWriteToArrays;

- (void)setCellUserInteractionEnabled;
@end
