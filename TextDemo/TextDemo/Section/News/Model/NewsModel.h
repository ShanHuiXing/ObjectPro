//
//  NewsModel.h
//  TextDemo
//
//  Created by 陈国辉 on 2017/1/13.
//  Copyright © 2017年 shown. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject

@property (nonatomic,copy)NSString *author;
@property (nonatomic,assign)NSInteger hasRead;
@property (nonatomic,copy)NSString *imgUrl;
@property (nonatomic,copy)NSString *position;
@property (nonatomic,assign)NSInteger thumbs;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *uuid;
@property (nonatomic,copy)NSString *createTime;

@end
