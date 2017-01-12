//
//  ImageDownloadHelper.h
//  TigoFood
//
//  Created by linxiao song on 15/2/3.
//  Copyright (c) 2015年 zorasun. All rights reserved.
//  图片下载器

#import <Foundation/Foundation.h>
#import "SDWebImageManager.h"

@interface ImageDownloadHelper : NSObject


//下载应用服务器的图片
+(void)downLoadAppImage:(NSString *)url progress:(SDWebImageDownloaderProgressBlock)progressBlock
              completed:(SDWebImageCompletionWithFinishedBlock)completedBlock;

//多图片下载应用服务器的图片
+(void)downLoadImages:(NSArray<NSString *> *)urlArray
             progress:(SDWebImageDownloaderProgressBlock)progressBlock
            Successed:(void(^)(NSArray *object))successed;

+(NSURL *)imageURL:(NSString *)urlStr;
/**
 *  将图片地址补充完整
 */
+(NSString *)imageUrlStr:(NSString *)urlStr;
@end
