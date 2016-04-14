//
//  CZPrepareLayout.m
//  数独
//
//  Created by Dolion.Hou on 16/4/10.
//  Copyright © 2016年 dolion. All rights reserved.
//

#import "CZPrepareLayout.h"

@implementation CZPrepareLayout

- (void)prepareLayout{

    [super prepareLayout];
    
    self.minimumLineSpacing = 2;
    
    self.minimumInteritemSpacing = 2;
    
    self.collectionView.bounces = NO;
    
    self.collectionView.showsVerticalScrollIndicator = NO;
    
    self.collectionView.shouldGroupAccessibilityChildren = NO;
    
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - 2 * 10 ) / 9 ;
//    
//    typedef struct UIEdgeInsets {
//        CGFloat top, left, bottom, right;  // specify amount to inset (positive) for each of the edges. values can be negative to 'outset'
//    } UIEdgeInsets;
    
    self.itemSize = CGSizeMake(width,width);
    
    self.collectionView.contentInset = UIEdgeInsetsMake(75, 2, 0, 2);
}


@end
