//
//  UIView+QWExtension.m
//  QuWangApp
//
//  Created by yangang on 15/8/4.
//  Copyright (c) 2015年 赵冬波. All rights reserved.
//

#import "UIView+OCExtension.h"

@implementation UIView (OCExtension)

-(void)setViewTop:(CGFloat)viewTop{
    CGRect frame = self.frame;
    frame.origin.y = viewTop;
    self.frame = frame;
}

-(CGFloat)viewTop{
    return self.frame.origin.y;
}

-(CGFloat)viewBottom{
    return self.frame.origin.y + self.frame.size.height;
}

-(void)setViewLeft:(CGFloat)viewLeft{
    CGRect frame = self.frame;
    frame.origin.x = viewLeft;
    self.frame = frame;
}

-(CGFloat)viewLeft{
    return self.frame.origin.x;
}


-(CGFloat)viewRight{
    return self.frame.origin.x + self.frame.size.width;
}

-(void)setViewWidth:(CGFloat)viewWidth{
    CGRect frame = self.frame;
    frame.size.width = viewWidth;
    self.frame = frame;
}

-(CGFloat)viewWidth{
    return self.frame.size.width;
}

-(void)setViewHeight:(CGFloat)viewHeight{
    CGRect frame = self.frame;
    frame.size.height = viewHeight;
    self.frame = frame;
}

-(CGFloat)viewHeight{
    return self.frame.size.height;
}

-(void)setViewSize:(CGSize)viewSize{
    CGRect frame = self.frame;
    frame.size = viewSize;
    self.frame = frame;
}

-(CGSize)viewSize{
    return self.frame.size;
}

-(void)setViewOrigin:(CGPoint)viewOrigin{
    CGRect frame = self.frame;
    frame.origin = viewOrigin;
    self.frame = frame;
}

-(CGPoint)viewOrigin{
    return self.frame.origin;
}

@end
