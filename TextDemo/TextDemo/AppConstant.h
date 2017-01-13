//
//  AppConstant.h
//  TextDemo
//
//  Created by 陈国辉 on 2017/1/13.
//  Copyright © 2017年 shown. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppConstant : NSObject

+(AppConstant *)sharedInstance;
//设置网络请求公用参数
-(void)setNetCommonParams;
-(void)clearNetCommonParams;
//图片请求地址 前缀
@property(nonatomic,copy)NSString *imagePrefix;
//图片上传地址 前缀
@property(nonatomic,copy)NSString *imageUploadPrefix;

//主工程地址
@property(nonatomic,copy)NSString *mainHostPrefix;
///文件下载地址
@property(nonatomic,copy)NSString *fileDownLoadPrefix;

@end
