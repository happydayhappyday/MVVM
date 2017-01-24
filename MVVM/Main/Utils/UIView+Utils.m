//
//  UIView+Utils.m
//  MVVM
//
//  Created by xiayuanqun on 17/1/19.
//  Copyright © 2017年 xiayuanqun. All rights reserved.
//

#import "UIView+Utils.h"

@implementation UIView (Utils)
//宽度
- (CGFloat)current_w{
    return self.frame.size.width;
}

//高度
- (CGFloat)current_h{
    return self.frame.size.height;
}

//当前view.framw的x、y、x+宽、y+高
- (CGFloat)current_x{
      return self.frame.origin.x;
}
- (CGFloat)current_y{
     return self.frame.origin.y;
}
- (CGFloat)current_x_w{
    return self.frame.origin.x + self.frame.size.width;
}
- (CGFloat)current_y_h{
    return self.frame.origin.y + self.frame.size.height;
}

@end
