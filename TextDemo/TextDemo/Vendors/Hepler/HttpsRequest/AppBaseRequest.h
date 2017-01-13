//
//  AppBaseRequest.h
//  TextDemo
//
//  Created by 陈国辉 on 2017/1/13.
//  Copyright © 2017年 shown. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>

typedef NS_ENUM(NSInteger,ZorasunRefreshCacheTimeType)
{
    kAppRequestCacheTimeTypeNone=1,
    kAppRequestCacheTimeTypeShort=2,
    kAppRequestCacheTimeTypeLong=3
};

@interface AppBaseRequest : YTKRequest
/**
 *  获取状态码
 */
-(NSInteger )getCodeStatus;
/**
 *  获取消息
 */
-(NSString * )getMsg;
/**
 *  获取content
 */
-(id)getContent;


/**
 *  加载loadinghud ，覆盖该方法，可以关闭HUD ,或者使用isDismissHud属性设置
 */
-(void)showLoadingHud;

/**
 *  是否隐藏请求时候的菊花
 */
@property(nonatomic,assign)BOOL isDismissHud;


/**
 *   缓存时间，二次请求的时候不真的发起请求 defalut 1 none
 */
@property(nonatomic,assign)ZorasunRefreshCacheTimeType cacheTimeType;
@end
