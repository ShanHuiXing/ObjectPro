//
//  AppConstant.m
//  TextDemo
//
//  Created by 陈国辉 on 2017/1/13.
//  Copyright © 2017年 shown. All rights reserved.
//

#import "AppConstant.h"
#import "YTKNetworkConfig.h"
#import "AppUrlArgumentsFilter.h"

@implementation AppConstant

static AppConstant *appConstant = nil;

+(AppConstant *)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        appConstant = [[self alloc]init];
    });
    
    return appConstant;
}

-(instancetype)init
{
    if (self = [super init])
    {
        YTKNetworkConfig *config = [YTKNetworkConfig sharedInstance];
        
        config.baseUrl = @"http://118.178.240.74:8080";
        _imagePrefix = @"";
        _imageUploadPrefix = @"";
        
    }
    
    return self;
}
/**
 *  普通参数跟随的方法
 */
-(void)setNetCommonParams
{
    //  YTKNetworkConfig *config = [YTKNetworkConfig sharedInstance];
    //  //添加公共参数
    //  NSMutableDictionary *params=[[NSMutableDictionary alloc]init];
    //  AccountManager *manager=[AccountManager sharedInstance];
    //  [manager selecetUserInfo];
    //  if (manager.user.userId) {
    //  [params setObject:manager.user.userId forKey:@"memberId"];
    //  }
    //  AppUrlArgumentsFilter *urlFilter = [AppUrlArgumentsFilter filterWithArguments:params];
    //  [config addUrlFilter:urlFilter];
}
-(void)clearNetCommonParams
{
    /*
     YTKNetworkConfig *config = [YTKNetworkConfig sharedInstance];
     [config clearUrlFilter];*/
}


@end
