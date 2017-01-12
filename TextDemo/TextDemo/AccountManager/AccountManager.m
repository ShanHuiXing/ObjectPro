//
//  AccountManager.m
//  Poop
//
//  Created by YaoFeng on 16/8/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "AccountManager.h"

#define ARCHIVE_KEY @"whatthefuckday!"

@implementation AccountManager
+ (AccountManager*)sharedInstance
{
    static AccountManager *manager;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        manager = [[self alloc] init];
    });
    return manager;
}
-(instancetype)init
{
    self =[super init];
    if (self) {
        
        [self logined];
        
        [self selecetUserInfo];
        
    }
    return self;
}
-(void)logined
{
    LoginUserModel * login = [self selecetUserInfo];
    if (login.userId.length>0) {
        self.isLogined = YES;
    }else{
        self.isLogined = NO;
    }
}
-(void)loginMthod
{
    self.isLogined = YES;
    [self saveUserInfo];//存储账号信息
}
-(void)resignMethod
{
    self.isLogined = NO;
    [self removeUserInfo];//移除账号信
}

///、归档路径
-(NSString *)archiveFilePath:(NSString *)fileName
{
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path = [documentDirectory stringByAppendingPathComponent:fileName];
    return path;
}

///序列化对象，写入归档文件，保存用户信息
- (void)saveUserInfo{
    NSString *writableDBPath = [self archiveFilePath:@"AccountInfo.archive"];
    [self writeArchievePath:writableDBPath andObject:self.user];
}

///归档反序列化 查询用户信息
-(LoginUserModel*)selecetUserInfo
{
    self.user=[[LoginUserModel alloc]init];
    NSString *path = [self archiveFilePath:@"AccountInfo.archive"];
    NSData *theData=[NSData dataWithContentsOfFile:path];
    NSKeyedUnarchiver * archiver = [[NSKeyedUnarchiver alloc]
                                    initForReadingWithData:theData];
    self.user= [archiver decodeObjectForKey:ARCHIVE_KEY];
    [archiver finishDecoding];
    return self.user;
}
///删除用户信息
-(void)removeUserInfo
{
    self.user=[[LoginUserModel alloc]init];
    [self saveUserInfo];
}

//归档写入操作
-(void)writeArchievePath:(NSString *)path andObject:(NSObject*)model
{   // 耗时的操作
    NSMutableData * theData = [NSMutableData data];
    NSKeyedArchiver * archiver = [[NSKeyedArchiver alloc]
                                  initForWritingWithMutableData:theData];
    [archiver encodeObject:model forKey:ARCHIVE_KEY];
    [archiver finishEncoding];
    [theData writeToFile:path atomically:YES];
 
}

@end
