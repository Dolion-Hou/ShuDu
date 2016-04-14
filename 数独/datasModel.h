//
//  datasModel.h
//  数独
//
//  Created by Dolion.Hou on 16/4/10.
//  Copyright © 2016年 dolion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface datasModel : NSObject

@property (nonatomic, copy) NSString * num;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

+ (instancetype)datasWithDictionary:(NSDictionary *)dict;

@end
