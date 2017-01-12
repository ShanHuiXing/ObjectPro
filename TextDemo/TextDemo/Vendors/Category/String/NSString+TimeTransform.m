//
//  NSString+TimeTransform.m
//  projectManager
//
//  Created by zorasun_zc on 15/4/18.
//  Copyright (c) 2015年 zorasun. All rights reserved.
//

#import "NSString+TimeTransform.h"

@implementation NSString (TimeTransform)
#pragma mark - 时间转换
- (instancetype)timeTran
{
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc]init];
    [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *createTime=[NSDate dateWithTimeIntervalSince1970:[self longLongValue]/1000];
    NSString *timeStr=[dateformatter stringFromDate:createTime];
    return timeStr;
}

- (instancetype)timeForTran
{
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc]init];
    [dateformatter setDateFormat:@"yyyy.MM.dd"];
    NSDate *createTime=[NSDate dateWithTimeIntervalSince1970:[self longLongValue]/1000];
    NSString *timeStr=[dateformatter stringFromDate:createTime];
    return timeStr;
}
@end
