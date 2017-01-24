//
//  Response.m
//  MVVM
//
//  Created by xiayuanqun on 17/1/19.
//  Copyright © 2017年 xiayuanqun. All rights reserved.
//

#import "Response.h"

@implementation Response


-(instancetype)initWithDictionary:(NSDictionary *)dic{
    kEnumServerState flag = kEnumServerStateSuccess;
    NSObject *data = @"";
    NSString *message = @"";
    NSString *status = @"";
    
    if([dic valueForKey:@"code"]){
        flag = [[dic valueForKey:@"code"]intValue];
    }
    data = [dic objectForKey:@"data"];
    message = [dic objectForKey:@"msg"];
    status = [dic objectForKey:@"status"];
    
    return [self initWithState:flag result:data message:message];
}

-(Response *)initWithState:(kEnumServerState)state result:(NSObject *)data message:(NSString *)message{
    self = [super init];
    if(self){
        _status = state;
        _data = data;
        _msg = message;
    }
    return self;
}
-(NSString *)description{
    return [NSString stringWithFormat:@"status=%@,data=%@,message=%@",@(_status),_data,_msg];
    
}
@end
