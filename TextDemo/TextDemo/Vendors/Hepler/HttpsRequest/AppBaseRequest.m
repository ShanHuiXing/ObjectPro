//
//  AppBaseRequest.m
//  TextDemo
//
//  Created by 陈国辉 on 2017/1/13.
//  Copyright © 2017年 shown. All rights reserved.
//

#import "AppBaseRequest.h"
#import "YTKNetworkConfig.h"

@implementation AppBaseRequest
-(id)init
{
    self=[super init];
    if (self) {
        [self showLoadingHud];
        self.cacheTimeType=kAppRequestCacheTimeTypeNone;
        YTKNetworkConfig *config = [YTKNetworkConfig sharedInstance];
        
        NSString *outPutUrl = @"";
//        //如果添加了公用参数，url中已经自动添加了公用参数，这里不需要在进行？拼接打印
//        for (NSString *key in paramDict.keyEnumerator) {
//            NSString *keyValue= [NSString stringWithFormat:@"%@=%@&",key,[paramDict objectForKey:key]];
//            outPutUrl= [outPutUrl stringByAppendingString:keyValue];
//        }
//        outPutUrl=[outPutUrl substringToIndex:outPutUrl.length-1];
        NSLog(@"====RequestUrl:%@%@?%@",config.baseUrl,self.requestUrl,outPutUrl);
        
    }
    return self;
}
#pragma mark 获取请求状态
-(NSInteger )getCodeStatus
{
    return [[[self responseJSONObject] objectForKey:@"success"]longValue];
}
#pragma mark 获取请求信息
-(NSString * )getMsg
{
    return [[self responseJSONObject] objectForKey:@"message"];
}
#pragma mark 获取请求数据
-(id)getContent
{
    NSLog(@"------josn%@----",[self responseJSONObject]);
    return  [[self responseJSONObject] objectForKey:@"datasource"];
}

#pragma mark 设置请求方式
- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}
#pragma mark 设置请求超时时间
- (NSTimeInterval)requestTimeoutInterval {
    return 60;
}
#pragma mark 设置请求http头参数
-(NSDictionary *)requestHeaderFieldValueDictionary{
    NSMutableDictionary *headParams = [NSMutableDictionary dictionary];
    
    return headParams;
}

#pragma mark 加载Hud
-(void)showLoadingHud
{
    if (!self.isDismissHud) {
//        [self addAccessory:[SVProgressHUD sharedView]];
    }
}

#pragma mark 缓存时间，二次请求的时候不真的发起请求 ,如果需要其他缓存时间的请求，进行覆盖
-(NSInteger)cacheTimeInSeconds
{
    NSInteger seconds=0;
    switch (_cacheTimeType) {
        case kAppRequestCacheTimeTypeLong:
            seconds=60*5;
            break;
        case kAppRequestCacheTimeTypeShort:
            seconds= 60*1;
            break;
        case kAppRequestCacheTimeTypeNone:
        default:
            break;
    }
    return seconds;
}

//关于统一处理 code 的方案
//- (id)jsonValidator {
//    // code获取的代码
//    NSInteger code = ...
//
//    BOOL isError = code != 1000;
//    if (isError) {
//        // 用这个结构去验证 -> 验证失败 -> 调用failure block
//        return @{ @"someKeyYouWillNeverUse":[NSObject class] };
//    }
//
//    // 这是你的固定结构，用于验证正确返回结果的时候
//    return @{
//             @"msg":[NSString class],
//             @"data":[NSObject class],
//             @"code":[NSNumber class]
//             };
//
//    // 如有特殊的网络请求，要验证非常细致的返回结果的结构，那就在它的类中override jsonValidator方法即可
//    // 这里验证大部分的网络请求返回结果
//    // 在我参与的项目中并不是每一个网络请求都会验证它结果的完整结构，这种情况下就满足需求了
//}
@end
