//
//  UIView+CTView.m
//  DoctorHealth
//
//  Created by shown on 16/8/23.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//

#import "UIView+CTView.h"

@implementation UIView (CTView)

#undef   KEY_CTTAGSTRING
#define KEY_CTTAGSTRING     "UIView.ctTagString"

/*--------------------------------------------------------------------*/
- (CGFloat)left {
    return self.frame.origin.x;
}
- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
/*--------------------------------------------------------------------*/
- (CGFloat)top {
    return self.frame.origin.y;
}
- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
/*--------------------------------------------------------------------*/
- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}
- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}
/*--------------------------------------------------------------------*/
- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}
- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}
/*--------------------------------------------------------------------*/
- (CGFloat)centerX {
    return self.center.x;
}
- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}
/*--------------------------------------------------------------------*/
- (CGFloat)centerY {
    return self.center.y;
}
- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}
/*--------------------------------------------------------------------*/
- (CGFloat)width {
    return self.frame.size.width;
}
- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
/*--------------------------------------------------------------------*/

- (CGFloat)height {
    return self.frame.size.height;
}
- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
/*--------------------------------------------------------------------*/
-(CGSize)size
{
    return self.frame.size;
}
-(void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
/*--------------------------------------------------------------------*/
-(CGPoint)origin
{
    return self.frame.origin;
}
-(void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}
/*--------------------------------------------------------------------*/
- (id)ctTagValue
{
    NSObject *obj = objc_getAssociatedObject(self, KEY_CTTAGSTRING);
    if (obj) {
        return obj;
    }
    return nil;
}
- (void)setCtTagValue:(id)ctTagValue
{
    objc_setAssociatedObject(self, KEY_CTTAGSTRING, ctTagValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)removeAllSubviews {
    while (self.subviews.count) {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)ctSetCornerRadius:(float)radius
{
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)ctSetBorderWidth:(float)width Color:(UIColor *)color
{
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
}
///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)ctSetContentMode:(UIViewContentMode)mode
{
    self.clipsToBounds = YES;
    self.contentMode = mode;
}
@end
