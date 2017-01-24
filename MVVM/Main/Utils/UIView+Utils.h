//
//  UIView+Utils.h
//  MVVM
//
//  Created by xiayuanqun on 17/1/19.
//  Copyright © 2017年 xiayuanqun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface  UIView (Utils)

//宽度
- (CGFloat)current_w;

//高度
- (CGFloat)current_h;

//当前view.framw的x、y、x+宽、y+高
- (CGFloat)current_x;
- (CGFloat)current_y;
- (CGFloat)current_x_w;
- (CGFloat)current_y_h;

@end
