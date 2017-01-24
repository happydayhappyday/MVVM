//
//  Tools.h
//  MVVM
//
//  Created by xiayuanqun on 17/1/24.
//  Copyright © 2017年 xiayuanqun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"
@interface Tools : NSObject


+(void)showHUD:(NSString *)text andView:(UIView *)view andHUD:(MBProgressHUD *)hud;;

@end
