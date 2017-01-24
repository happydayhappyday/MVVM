//
//  HomeViewModel.m
//  MVVM
//
//  Created by xiayuanqun on 17/1/19.
//  Copyright © 2017年 xiayuanqun. All rights reserved.
//

#import "HomeViewModel.h"
#import "APIClient.h"
#import "Define.h"
#import "HomeModel.h"
@implementation HomeViewModel
//处理网络获取的数据
- (void)handleDataWithSuccess:(void(^)(NSArray *arr))success
                      failure:(void (^)(NSError *error))failure{
    [[APIClient sharedManager]netWorkGetHomePageListWithPageSize:20 pageNum:0 success:^(Response *response) {
        NSLog(@"......response.description : %@",response.description);
        if(response.status == kEnumServerStateSuccess){
            NSLog(@"请求成功");
            NSMutableArray *tmpArr = [NSMutableArray array];
            for(NSDictionary *subDic in (NSArray *)[response.data valueForKey:@"results"]){
                HomeModel *model = [[HomeModel alloc]initWithDic:subDic];
                
                [tmpArr addObject:model];
            }
            success(tmpArr);
        }
    } failure:^(NSError *error) {
        failure(error);
    }];
}
@end
