//
//
//
//
//  Created by linxiao song on 15/1/27.
//  Copyright (c) 2015年 zorasun. All rights reserved.
//

#import <Foundation/Foundation.h>
extern NSString *const kIsEmailRregularString;
extern NSString *const kIsNumberRregularString;
extern NSString *const kIsEnglishRregularString;
extern NSString *const kIsChineseWordsRregularString;
extern NSString *const kIsPassWordRregularString;
extern NSString *const KIsInternetUrlRregularString;
extern NSString *const KIsPhoneNumberRregularString;
extern NSString *const kIsElevenDigitNumRregularString;
extern NSString *const kIsIdentifyCardNumberRregularString;
extern NSString *const kIsPostNumber;//是否是邮编
extern NSString *const kIsVercode;
extern NSString *const kIsAccount;// 手机或者邮箱
@interface NSString (Regular)

- (BOOL)isValidateEmail;//邮箱符合性验证。
- (BOOL)isNumber;//全是数字。
- (BOOL)isEnglishWords;//验证英文字母。
- (BOOL)isValidatePassword;//验证密码：6—16位，只能包含字符、数字和 下划线。
- (BOOL)isChineseWords;//验证是否为汉字。
- (BOOL)isInternetUrl;//验证是否为网络链接。
- (BOOL)isPhoneNumber;//验证是否为电话号码。正确格式为：XXXX-XXXXXXX，XXXX-XXXXXXXX，XXX-XXXXXXX，XXX-XXXXXXXX，XXXXXXX，XXXXXXXX
- (BOOL)isElevenDigitNum;//判断是否为11位的数字
- (BOOL)isIdentifyCardNumber;//验证15或18位身份证。

///通用方法 ，验证 是否符合规则
+(BOOL)isValidateRegularExpression:(NSString *)strDestination byExpression:(NSString *)strExpression;
@end
