//
//  HomeViewModel.h
//  MVVM
//
//  Created by xiayuanqun on 17/1/19.
//  Copyright © 2017年 xiayuanqun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeViewModel : NSObject

//处理网络获取的数据
- (void)handleDataWithSuccess:(void(^)(NSArray *arr))success
                      failure:(void (^)(NSError *error))failure;
@end
