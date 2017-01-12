//
//  ImageUpLoadHelper.h
//  TextDemo
//
//  Created by shown on 16/11/15.
//  Copyright © 2016年 shown. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageUpLoadHelper : NSObject
+(void)upLoadImageWithName:(UIImage *)image parameters:(NSDictionary *)params;
// 上传图片,可多张上传

@end

//
/////多张图片上传提交的模型
//@interface FormData : NSObject
///**请求参数名*/
//@property (nonatomic, copy, readwrite) NSString *name;
///**保存到服务器的文件名*/
//@property (nonatomic, copy, readwrite) NSString *fileName;
///**文件类型*/
//@property (nonatomic, copy, readwrite) NSString *mimeType;
///**二进制数据*/
//@property (nonatomic, strong, readwrite) NSData *data;
//
//@end
