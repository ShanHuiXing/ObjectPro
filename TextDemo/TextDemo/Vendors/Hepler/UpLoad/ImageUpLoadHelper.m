//
//  ImageUpLoadHelper.m
//  TextDemo
//
//  Created by shown on 16/11/15.
//  Copyright © 2016年 shown. All rights reserved.
//

#import "ImageUpLoadHelper.h"

@implementation ImageUpLoadHelper

+(void)upLoadImageWithName:(UIImage *)image parameters:(NSDictionary *)params
{
    //1.创建管理者对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //2.上传文件
    [manager POST:@"" parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //图片转二进制
         NSData *data = UIImagePNGRepresentation(image);
        // 可以在上传时使用当前的系统事件作为文件名
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        // 设置时间格式
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
        [formData appendPartWithFileData:data name:@"file" fileName:fileName mimeType:@"image/png"];
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSLog(@"---------%lld------",task.countOfBytesSent);
        NSLog(@"请求成功：%@",responseObject);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
   
}


//+(void)upLoadImageWithName:(UIImage *)image parameters:(NSDictionary *)params
//{
//    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:@"http://example.com/upload" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        [formData appendPartWithFileURL:[NSURL fileURLWithPath:@"file://path/to/image.jpg"] name:@"file" fileName:@"filename.jpg" mimeType:@"image/png" error:nil];
//    } error:nil];
//    
//    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
//    
//    NSURLSessionUploadTask *uploadTask;
//
////    uploadTask = [manager
////                  uploadTaskWithStreamedRequest:request
////                  progress:^(NSProgress * _Nonnull uploadProgress) {
////                      // This is not called back on the main queue.
////                      // You are responsible for dispatching to the main queue for UI updates
////                      dispatch_async(dispatch_get_main_queue(), ^{
////                          //Update the progress view
////                          [progressView setProgress:uploadProgress.fractionCompleted];
////                      });
////                  }
////                  completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
////                      if (error) {
////                          NSLog(@"Error: %@", error);
////                      } else {
////                          NSLog(@"%@ %@", response, responseObject);
////                      }
////                  }];
//    
//    [uploadTask resume];
//}
@end
