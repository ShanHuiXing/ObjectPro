//
//  UIView+CTView.h
//  DoctorHealth
//
//  Created by shown on 16/8/23.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CTView)
/**
 *常用属性参数
 **/
@property (nonatomic) CGFloat left;

@property (nonatomic) CGFloat top;

@property (nonatomic) CGFloat right;

@property (nonatomic) CGFloat bottom;

@property (nonatomic) CGFloat width;

@property (nonatomic) CGFloat height;

@property (nonatomic) CGFloat centerX;

@property (nonatomic) CGFloat centerY;

@property (nonatomic) CGPoint origin;

@property (nonatomic) CGSize size;

/**
 *  扩展属性，可以传任何对象
 */
@property (nonatomic, weak) id ctTagValue;

/**
 *  移除所有子视图
 */
-(void)removeAllSubviews;

/**
 *  设置圆角
 */
- (void)ctSetCornerRadius:(float)radius;

/**
 *  设置边框、颜色
 */
- (void)ctSetBorderWidth:(float)width Color:(UIColor *)color;

/**
 *  设置图片可视区域
 */
- (void)ctSetContentMode:(UIViewContentMode)mode;

@end
