//
//  NSString+CaculateBounds.m
//  zorasunLibary
//
//  Created by 陈炜来 on 15/2/25.
//  Copyright (c) 2015年 zorasun. All rights reserved.
//

#import "NSString+CaculateBounds.h"

@implementation NSString (CaculateBounds)
//计算label size
-(CGSize)caculateWidth:(UIFont *)font andWithSize:(CGSize )asize
{
    CGSize stringSize = [self boundingRectWithSize:asize
                                                options:(NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin)
                                             attributes:@{NSFontAttributeName : font}
                                                context:nil].size;
    return stringSize;
}
@end
