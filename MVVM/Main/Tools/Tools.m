//
//  Tools.m
//  MVVM
//
//  Created by xiayuanqun on 17/1/24.
//  Copyright © 2017年 xiayuanqun. All rights reserved.
//

#import "Tools.h"

@implementation Tools
+(void)showHUD:(NSString *)text andView:(UIView *)view andHUD:(MBProgressHUD *)hud{
    [view addSubview:hud];
    
   // hud.labelText = text;
    hud.label.text = text;
    hud.backgroundColor = [UIColor redColor];
    hud.square = YES;
    [hud showAnimated:YES];
//    [hud show:YES];
}
@end
