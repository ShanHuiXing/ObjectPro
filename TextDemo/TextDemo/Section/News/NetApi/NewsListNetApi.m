//
//  NewsListNetApi.m
//  TextDemo
//
//  Created by 陈国辉 on 2017/1/13.
//  Copyright © 2017年 shown. All rights reserved.
//

#import "NewsListNetApi.h"

@implementation NewsListNetApi
{
    NSString *_userId;
}
-(id)initWithUserId:(NSString *)userId
{
    if (self = [super init])
    {
        _userId = userId;
    }
    return self;
}

-(NSString *)requestUrl
{
    return @"/shf/api/article/list";
}
-(id)requestArgument
{
    return @{
             @"user" : _userId
             };
}

@end
