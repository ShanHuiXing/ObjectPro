//
//
//  ZXHT
//
//  Created by Future on 14-10-30.
//  Copyright (c) 2014年 xiamenzhuoxuncompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Addition)

/**
 *  计算字符串的字数。
 *  string:输入字符串。
 *  return  返回输入字符串的字数。
 */
- (int)wordsCount;

- (NSString *)URLDecodedString;
- (NSString *)URLEncodedString;
- (NSString *)encodeStringWithUTF8;
- (NSUInteger)byteLengthWithEncoding:(NSStringEncoding)encoding;

@end
