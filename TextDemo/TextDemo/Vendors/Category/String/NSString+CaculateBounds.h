//
//  NSString+CaculateBounds.h
//  zorasunLibary
//
//  Created by 陈炜来 on 15/2/25.
//  Copyright (c) 2015年 zorasun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGGeometry.h>
#import  <UIKit/UIKit.h>
@interface NSString (CaculateBounds)
-(CGSize)caculateWidth:(UIFont *)font andWithSize:(CGSize )asize;
@end
