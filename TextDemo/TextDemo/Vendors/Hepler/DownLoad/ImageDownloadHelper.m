//
//  ImageDownloadHelper.m
//  TigoFood
//
//  Created by linxiao song on 15/2/3.
//  Copyright (c) 2015年 zorasun. All rights reserved.
//

#import "ImageDownloadHelper.h"

@implementation ImageDownloadHelper
//下载图片的基础方法
+(void)downLoadImage:(NSString *)urlStr progress:(SDWebImageDownloaderProgressBlock)progressBlock
           completed:(SDWebImageCompletionWithFinishedBlock)completedBlock {

    NSURL *url= [ImageDownloadHelper imageURL:urlStr];
    [[SDWebImageManager sharedManager]downloadImageWithURL:url options:SDWebImageProgressiveDownload progress:progressBlock completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        if (finished) {
               NSLog(@" SDWebImageManager download Finished %@" ,imageURL);
        }
     
        if (error.localizedDescription) {
            NSLog(@"图片下载错误：%@",[error localizedDescription]);
        }
        completedBlock(image,error,cacheType,finished,imageURL);
    }];
}

//多图下载
+(void)downLoadImages:(NSArray<NSString *> *)urlArray
             progress:(SDWebImageDownloaderProgressBlock)progressBlock
            Successed:(void(^)(NSArray *object))successed {
    
    NSMutableArray *imageArr = [NSMutableArray array];
    for (int i = 0; i < urlArray.count; i++) {
            NSURL *url= [ImageDownloadHelper imageURL:urlArray[i]];
            [[SDWebImageManager sharedManager]downloadImageWithURL:url options:SDWebImageProgressiveDownload progress:progressBlock completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                if (finished) {
                    NSLog(@" SDWebImageManager download Finished %@" ,imageURL);
                }
               
                if (error.localizedDescription) {
                    NSLog(@"图片下载错误：%@",[error localizedDescription]);
                }
                [imageArr addObject:image];
            }];
    }
    
    dispatch_barrier_async(dispatch_get_main_queue(), ^{
        successed(imageArr);
    });
}



//下载应用图片
+(void)downLoadAppImage:(NSString *)url progress:(SDWebImageDownloaderProgressBlock)progressBlock
              completed:(SDWebImageCompletionWithFinishedBlock)completedBlock {

    NSLog(@"开始下载图片");
    [self downLoadImage:url progress:progressBlock completed:completedBlock];
}

+(NSURL *)imageURL:(NSString *)urlStr
{

    return [NSURL  URLWithString: [self imageUrlStr:urlStr]];
}
+(NSString *)imageUrlStr:(NSString *)urlStr
{
    if ([urlStr hasPrefix:@"http://"]|| [urlStr hasPrefix:@"https://"]) {
        return urlStr;
    }

    NSString *fullUrlStr=[NSString stringWithFormat:@"%@",urlStr];

    return fullUrlStr;
}

@end
