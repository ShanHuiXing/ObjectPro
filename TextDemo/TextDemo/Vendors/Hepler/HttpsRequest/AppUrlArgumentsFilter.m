//
//  AppUrlArgumentsFilter.m
//  TextDemo
//
//  Created by 陈国辉 on 2017/1/13.
//  Copyright © 2017年 shown. All rights reserved.
//

#import "AppUrlArgumentsFilter.h"
#import "YTKNetworkPrivate.h"

@implementation AppUrlArgumentsFilter
{
    NSDictionary *_arguments;
}
+ (AppUrlArgumentsFilter *)filerWithArguments:(NSDictionary *)arguments {
    return [[self alloc] initWithArguments:arguments];
}

- (id)initWithArguments:(NSDictionary *)arguments {
    self = [super init];
    if (self) {
        _arguments = arguments;
    }
    return self;
}

- (NSString *)filterUrl:(NSString *)originUrl withRequest:(YTKBaseRequest *)request {
    return [YTKNetworkPrivate urlStringWithOriginUrlString:originUrl appendParameters:_arguments];
}
@end
