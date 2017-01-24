//
//  BaseModel.m
//  MVVM
//
//  Created by xiayuanqun on 17/1/19.
//  Copyright © 2017年 xiayuanqun. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
-(instancetype)initWithDic:(NSDictionary *)dic{
    NSError *error = nil;
    self = [self initWithDictionary:dic error:&error];
    return self;
}
@end
