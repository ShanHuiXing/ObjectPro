//
//  AFHTTPClient.h
//  TextDemo
//
//  Created by shown on 16/11/15.
//  Copyright © 2016年 shown. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFHTTPClient : NSObject
// GET请求
+ (void)getJSONPath:(NSString *)path Params:(id)params Successed:(void(^)(id object))successed Failed:(void(^)(id error))failed;

// POST请求
+ (void)PostJSONPath:(NSString *)path Params:(id)params Successed:(void(^)(id object))successed Failed:(void(^)(id error))failed;

@end
