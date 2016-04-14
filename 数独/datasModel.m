//
//  datasModel.m
//  数独
//
//  Created by Dolion.Hou on 16/4/10.
//  Copyright © 2016年 dolion. All rights reserved.
//

#import "datasModel.h"

@implementation datasModel

- (instancetype)initWithDictionary:(NSDictionary *)dict{

    self = [super init];
    
    if (self) {
        
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)datasWithDictionary:(NSDictionary *)dict{

    return [[self alloc] initWithDictionary:dict];
}



@end
