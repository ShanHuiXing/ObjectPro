//
//  NSString+MD5Helper.m
//  zorasunLibary
//
//  Created by Future on 15/1/22.
//  Copyright (c) 2015年 zorasun. All rights reserved.
//

#import "NSString+MD5Helper.h"


@implementation NSString (MD5Helper)
#pragma mark -- MD516加密
-(NSString *)md5Transform
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    NSString *md5String=  [NSString stringWithFormat:
                           @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                           result[0], result[1], result[2], result[3],
                           result[4], result[5], result[6], result[7],
                           result[8], result[9], result[10], result[11],
                           result[12], result[13], result[14], result[15]
                           ];
    //再进行转成全小写
    md5String= [md5String lowercaseString];
    //    DMLog(@"MD5 ：%@",md5String)
    return md5String;

}

@end
