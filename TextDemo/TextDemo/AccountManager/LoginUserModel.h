//
//  LoginUserModel.h
//  TigoFood
//
//  Created by linxiao song on 15/1/29.
//  Copyright (c) 2015年 zorasun. All rights reserved.
//  登录的用户单例

#import <Foundation/Foundation.h>

@interface LoginUserModel : NSObject<NSCoding>
//+(LoginUserModel *)sharedInstance;

/**
 *  爱医
 */
@property(nonatomic,copy)NSString *account;//用户账户
@property(nonatomic,copy)NSString *userId;//用户Id
@property(nonatomic,copy)NSString *email;// 邮箱
@property(nonatomic,copy)NSString *gender;//性别 （0，1）
@property(nonatomic,copy)NSString *sex;//性别 （0，1）
@property(nonatomic,copy)NSString *realName;//真实姓名
@property(nonatomic,copy)NSString *orgId;//所属部门id
@property(nonatomic,copy)NSString *orgName;//所属部门名称

@end
