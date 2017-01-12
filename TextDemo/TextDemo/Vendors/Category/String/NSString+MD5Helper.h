//
//  NSString+MD5Helper.h
//  zorasunLibary
//
//  Created by Future on 15/1/22.
//  Copyright (c) 2015年 zorasun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
@interface NSString (MD5Helper)
-(NSString *)md5Transform;

@end
