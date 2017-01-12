//
//  AppMacro.h
//  TextDemo
//
//  Created by shown on 16/11/14.
//  Copyright © 2016年 shown. All rights reserved.
//

#ifndef AppMacro_h
#define AppMacro_h
/*****************************************************************************************/
#pragma mark --- 关于IP地址
//是否为测试环境
#define TEST_ENVIRONMENT

#ifdef TEST_ENVIRONMENT
//测试网
#define DHServerIP @"http://120.55.242.236:8080"

//#define DHServerIP @"http://192.168.16.204:8080"
#define DHNewServerIP @"http://118.178.240.74:8080" //新的
#else
//正式网
#define DHServerIP @"http://www.popodd.com"
#define DHNewServerIP @"http://118.178.240.74:8080" //新的
#endif

/*****************************************************************************************/
#pragma mark --- 关于UI
// 屏幕宽度
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
// 屏幕高度
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
/*****************************************************************************************/
#pragma mark --- 关于字体
//字体
#define FONT_WITH_SIZE(SIZE) [UIFont fontWithName:k_Font size:SIZE]
#define FONT_BOLD_WITH_SIZE(SIZE) [UIFont fontWithName:k_FontFold size:SIZE]
/*****************************************************************************************/
#pragma mark --- 关于颜色

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]
#define RGBCOLOR16(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//颜色1   主调色
#define mainColor  RGBCOLOR16(0x47d584)
//颜色2   标题 (黑色)
#define colorWith3  RGBCOLOR16(0x333333)
//颜色3   内容 (黑灰色)
#define colorWith6  RGBCOLOR16(0x666666)
//颜色4   内容 (灰色)
#define colorWith9 RGBCOLOR16(0x999999)
//颜色5   线条颜色  (浅灰色)
#define lineColor RGBCOLOR16(0xe7e7e7)

/*****************************************************************************************/
#pragma mark --- 系统型号
//iOS7
#define IOS7 ([UIDevice currentDevice].systemVersion.floatValue>=7.0)
//iOS8
#define IOS8 ([UIDevice currentDevice].systemVersion.floatValue>=8.0)
//iOSV
#define IOSV(v) ([UIDevice currentDevice].systemVersion.floatValue>=v)
#define STAR_Y ([UIDevice currentDevice].systemVersion.floatValue>=7.0 ? 44 : 44)

/*****************************************************************************************/
#pragma mark --- 其他常用快捷宏
//提示框
#define kPOP(msg) [[PopToastView sharedInstance]popShowWithTitle:msg AndTime:3.0];

#endif /* AppMacro_h */
