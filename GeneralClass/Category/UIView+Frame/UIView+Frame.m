//
//  UIView+Frame.m
//  ServiceStation
//
//  Created by msc on 16/12/28.
//  Copyright © 2016年 Ehu. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}



- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

//-----------------------------------------------------------------

- (void)setXRight:(CGFloat)xRight
{
    CGRect frame = self.frame;
    frame.origin.x = xRight - self.frame.size.width;
    self.frame = frame;
}

-(CGFloat)xRight
{
    return self.frame.origin.x + self.frame.size.width;
}




- (void)setYBottom:(CGFloat)yBottom
{
    CGRect frame = self.frame;
    frame.origin.y = yBottom - self.frame.size.height;
    self.frame = frame;
}

-(CGFloat)yBottom
{
    return self.frame.origin.y + self.frame.size.height;
}


//-----------------------------------------------------------------

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}


//-----------------------------------------------------------------

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

//-----------------------------------------------------------------
- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}


//-----------------------------------------------------------------

- (void)setOrigin:(CGPoint)origin
{
    CGFloat x = origin.x;
    CGFloat y = origin.y;
    CGRect frame = self.frame;
    frame.origin.x = x;
    frame.origin.y = y;
    self.frame = frame;
    
}

-(CGPoint)origin
{
    CGRect frame = self.frame;
    CGFloat x = frame.origin.x;
    CGFloat y = frame.origin.y;
    return CGPointMake(x, y);
    
}



@end
