//
//  AccountManager.h
//  Poop
//
//  Created by YaoFeng on 16/8/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginUserModel.h"

@interface AccountManager : NSObject
@property(nonatomic,strong)LoginUserModel *user;
@property(nonatomic, assign) BOOL isLogined;//是否登录

+ (AccountManager*)sharedInstance;
- (void)saveUserInfo;       //保存用户信息
-(void)removeUserInfo;      //删除用户信息
//登录
-(void)loginMthod;
//注销
-(void)resignMethod;
@end
