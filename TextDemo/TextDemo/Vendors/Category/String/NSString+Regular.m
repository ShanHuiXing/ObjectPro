//
//  NSString+Regular
//  zxht
//
//  Created by linxiao song on 15/1/27.
//  Copyright (c) 2015年 zorasun. All rights reserved.
//
#import "NSString+Regular.h"
 NSString *const kIsEmailRregularString=@"^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$";
 NSString *const kIsNumberRregularString=@"^[0-9]*$";
 NSString *const kIsEnglishRregularString=@"^[A-Za-z]+$";
 NSString *const kIsChineseWordsRregularString=@"^[\u4e00-\u9fa5],{0,}$";
// NSString *const kIsPassWordRregularString=@"^[\\w\\d_]{6,16}$";
NSString *const kIsPassWordRregularString=@"^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{6,20}";
 NSString *const KIsInternetUrlRregularString=@"^http://([\\w-]+\\.)+[\\w-]+(/[\\w-./?%&=]*)?$ ；^[a-zA-z]+://(w+(-w+)*)(.(w+(-w+)*))*(?S*)?$";
 NSString *const KIsPhoneNumberRregularString=@"^1[3|4|5|7|8][0-9]\\d{8}$";
 NSString *const kIsElevenDigitNumRregularString=@"^[0-9]*$";
 NSString *const kIsIdentifyCardNumberRregularString=@"^\\d{14}([0-9]|x|X)$|\\d{17}([0-9]|x|X)$";//@"^\\d{15}|\\d{}18$";
 NSString *const kIsPostNumber=@"^\\d{6}$";//是否是邮编
 NSString *const kIsVercode=@"^\\d{0,}$";//是否是验证码
 NSString *const kIsAccount=@"^\\d{11}$|^\\d{6}$";//是否是账号、手机、或者邮箱


/*
_cardNumber.pattern = @"^(\\d{4}(?: )){3}\\d{2}$"; //纯数字，前4一空重复三次，再跟2位
_cardholder.pattern = @"^[a-zA-Z ]{3,}$";//纯字母
_validUntil.pattern = @"^(1[0-2]|(?:0)[1-9])(?:/)\\d{2}$";//  00/88 00/99这种格式
_cvv.pattern = @"^\\d{3}$";//三位纯数字
_date.pattern = @"^(3[0-1]|[1-2][0-9]|(?:0)[1-9])(?:\\.)(1[0-2]|(?:0)[1-9])(?:\\.)[1-9][0-9]{3}$";//日期 05.06.2014
_time.pattern = @"^(2[0-3]|1[0-9]|(?:0)[0-9])(?::)([0-5][0-9])$";//时间：12：34
 //    [a-zA-Z0-9\u4E00-\u9FA5]{2,20}  这是带汉字
 //   ^[\u4e00-\u9fa5_a-zA-Z_]{2,25}$  不带特殊字符

 NSString *patternPsw=@"^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{6,}$"//数字、字母、字符至少包含两种。
 @"^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$"
 ^\\d{17}([0-9]|x|X)$
 */
@implementation NSString (Regular)

//通用方法 ，验证 是否符合规则
+(BOOL)isValidateRegularExpression:(NSString *)strDestination byExpression:(NSString *)strExpression
{
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", strExpression];
    return [predicate evaluateWithObject:strDestination];
}

- (BOOL)isValidateEmail
{
 
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", kIsEmailRregularString];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isNumber
{

    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", kIsNumberRregularString];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isEnglishWords
{
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", kIsEnglishRregularString];
    return [predicate evaluateWithObject:self];
}

//字母数字下划线，6－16位
- (BOOL)isValidatePassword
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", kIsPassWordRregularString];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isChineseWords
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", kIsChineseWordsRregularString];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isInternetUrl
{
//    NSString *regex = @"^http://([\\w-]+\\.)+[\\w-]+(/[\\w-./?%&=]*)?$ ；^[a-zA-z]+://(w+(-w+)*)(.(w+(-w+)*))*(?S*)?$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", KIsInternetUrlRregularString];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isPhoneNumber
{
//    NSString *regex = @"^(\(\\d{3,4}\\)|\\d{3,4}-)?\\d{7,8}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", KIsPhoneNumberRregularString];
    return [predicate evaluateWithObject:self];
}

- (BOOL)isElevenDigitNum
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", kIsElevenDigitNumRregularString];
    BOOL result = [predicate evaluateWithObject:self];
    
    if (result && self.length == 11)
        return YES;
    return NO;
}

- (BOOL)isIdentifyCardNumber
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", kIsVercode];
    return [predicate evaluateWithObject:self];
}


@end
