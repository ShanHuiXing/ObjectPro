//
//  AppUrlArgumentsFilter.h
//  TextDemo
//
//  Created by 陈国辉 on 2017/1/13.
//  Copyright © 2017年 shown. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTKNetworkConfig.h"
#import "YTKBaseRequest.h"

@interface AppUrlArgumentsFilter : NSObject<YTKUrlFilterProtocol>

+(AppUrlArgumentsFilter *)filerWithArguments:(NSDictionary *)arguments;

-(NSString *)filterUrl:(NSString *)originUrl withRequest:(YTKBaseRequest *)request;

@end
