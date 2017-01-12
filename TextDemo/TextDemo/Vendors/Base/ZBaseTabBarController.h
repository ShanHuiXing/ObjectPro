//
//  ZBaseTabBarController.h
//  ZFramework
//
//  Created by 郑辉煌 on 15/6/4.
//  Copyright (c) 2015年 anu. All rights reserved.
//  标签页基类

#import <UIKit/UIKit.h>
@class ZBaseTabBarView;
@interface ZBaseTabBarController : UITabBarController
//自定义样式
@property (nonatomic,strong)ZBaseTabBarView *customerTabBar;

-(void)setChildNavigationController:(UINavigationController *)navc;

@end
