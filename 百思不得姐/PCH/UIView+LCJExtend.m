//
//  UIView+LCJExtend.m
//  百思不得姐
//
//  Created by minya on 2017/8/24.
//  Copyright © 2017年 LiChaoJun. All rights reserved.
//

#import "UIView+LCJExtend.h"

@implementation UIView (LCJExtend)

-(CGFloat)lcj_width
{
    return self.frame.size.width;
}

-(CGFloat)lcj_height
{
    return self.frame.size.height;
}

-(CGFloat)lcj_x
{
    return self.frame.origin.x;
}

-(CGFloat)lcj_y
{
    return self.frame.origin.y;
}

-(CGFloat)lcj_centerX
{
    return self.center.x;
}

-(CGFloat)lcj_centerY
{
    return self.center.y;
}

-(void)setLcj_width:(CGFloat)lcj_width
{
    CGRect frame = self.frame;
    frame.size.width = lcj_width;
    self.frame = frame;
}

-(void)setLcj_height:(CGFloat)lcj_height
{
    CGRect frame = self.frame;
    frame.size.height = lcj_height;
    self.frame = frame;
}

-(void)setLcj_x:(CGFloat)lcj_x
{
    CGRect frame = self.frame;
    frame.origin.x = lcj_x;
    self.frame = frame;
}

-(void)setLcj_y:(CGFloat)lcj_y
{
    CGRect frame = self.frame;
    frame.origin.y = lcj_y;
    self.frame = frame;
}

-(void)setLcj_centerX:(CGFloat)lcj_centerX
{
    CGPoint center = self.center;
    center.x = lcj_centerX;
    self.center = center;
}

-(void)setLcj_centerY:(CGFloat)lcj_centerY
{
    CGPoint center = self.center;
    center.y = lcj_centerY;
    self.center = center;
}

@end
