//
//  NetTool.h
//  MVVM
//
//  Created by xiayuanqun on 17/1/19.
//  Copyright © 2017年 xiayuanqun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Response.h"
@interface NetTool : NSObject

+ (NetTool *)shareManager;

/**
 *  get请求
 *
 *  @param url     url
 *  @param success 成功回调
 *  @param failure 失败回调
 */

-(void)httpGetRequest:(NSString *)url withParamter:(NSDictionary *)parameter success:(void (^)(Response *response))success failure:(void (^)(NSError *error))failure;

@end
