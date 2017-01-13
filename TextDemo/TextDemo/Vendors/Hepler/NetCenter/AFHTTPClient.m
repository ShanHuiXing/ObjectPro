//
//  AFHTTPClient.m
//  TextDemo
//
//  Created by shown on 16/11/15.
//  Copyright © 2016年 shown. All rights reserved.
//

#import "AFHTTPClient.h"

/**
 *  是否开启https SSL 验证
 *
 *  @return YES为开启，NO为关闭
 */
#define openHttpsSSL NO
/**
 *  SSL 证书名称，仅支持cer格式。“app.bishe.com.cer”,则填“app.bishe.com”
 */
#define certificate @"adn"


@implementation AFHTTPClient
// get请求
+ (void)getJSONPath:(NSString *)path Params:(id)params Successed:(void (^)(id))successed Failed:(void (^)(id))failed
{
     [self starInfocatorVisible];
    NSString *fullUrl = [NSString stringWithFormat:@"%@%@",DHNewServerIP,path];

    NSLog(@"-------HttpUrl--------------%@%@",fullUrl,[self dictionaryToJson:params]);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 加上这行代码，https ssl 验证。
    if(openHttpsSSL)
    {
        [manager setSecurityPolicy:[self customSecurityPolicy]];
    }
    manager.requestSerializer = [AFHTTPRequestSerializer serializer]; //请求格式
    manager.responseSerializer = [AFJSONResponseSerializer serializer];  //申明返回的结果是json类型
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    
    [manager GET:fullUrl parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        //请求成功返回
        NSLog(@"=======================================%@",responseObject);
        
        successed(responseObject);
        [self stopIndicatorVisible];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //请求错误返回
        NSLog(@"=======================================%@",error);
        failed(error);
        [self showError:error.localizedDescription];
    }];
}
// post请求
+ (void)PostJSONPath:(NSString *)path Params:(id)params Successed:(void (^)(id))successed Failed:(void (^)(id))failed
{
     [self starInfocatorVisible];
    NSString *fullUrl = [NSString stringWithFormat:@"%@%@",DHServerIP,path];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 加上这行代码，https ssl 验证。
    if(openHttpsSSL)
    {
        [manager setSecurityPolicy:[self customSecurityPolicy]];
    }
//    manager.securityPolicy.allowInvalidCertificates = YES;//设置对证书的处理方式
//    manager.securityPolicy.validatesDomainName = NO;
    manager.requestSerializer = [AFHTTPRequestSerializer serializer]; //请求格式
    manager.responseSerializer = [AFJSONResponseSerializer serializer];  //申明返回的结果是json类型
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    
    [manager POST:fullUrl parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        //请求成功返回
        NSLog(@"=======================================%@",responseObject);
        successed(responseObject);
        [self stopIndicatorVisible];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //请求错误返回
        NSLog(@"=======================================%@",error);
        failed(error);
        [self showError:error.localizedDescription];
    }];
}


+ (AFSecurityPolicy*)customSecurityPolicy
{
    // /先导入证书
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:certificate ofType:@"cer"];//证书的路径
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    
    // AFSSLPinningModeCertificate 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    
    // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    // 如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    
    //validatesDomainName 是否需要验证域名，默认为YES；
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = NO;
    
    securityPolicy.pinnedCertificates = @[certData];
    
    return securityPolicy;
}

#pragma mark - 网络加载相关

+ (void)starInfocatorVisible {
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    [SVProgressHUD show];
    [SVProgressHUD setBackgroundColor:[UIColor blackColor]];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    
}


+ (void)stopIndicatorVisible {
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    [SVProgressHUD dismiss];
    
}

+ (void)showError:(NSString *)errorString {
    
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    [SVProgressHUD showWithStatus:errorString];
    
    
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [SVProgressHUD  dismiss];
        
    });
    
}
#pragma mark -----字典转字符串
+ (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    if (dic==nil)
    {
        return @"";
    }
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}
@end
