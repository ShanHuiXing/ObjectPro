//
//  PopToastView.h
//  ZXHT
//
//  Created by Future on 14-7-24.
//  Copyright (c) 2014年 xiamenzhuoxuncompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
/*使用方法：
_prefix.pch中 import
 
 PopToastView *pop=[PopToastView sharedInstance];
 [pop popShowWithTitle:@"这是一个很长很长的提示框" AndTime:3];
 */
@interface PopToastView : UIView
{
    UIImageView *_imagev;
    UILabel *_label;

}
@property (assign, nonatomic) CGFloat offsetX;
@property (assign, nonatomic) CGFloat offsetY;
+ (PopToastView *)sharedInstance;
+ (id) allocWithZone:(NSZone *)zone ;
-(void)popShowWithTitle:(NSString *)title AndTime:(float )time;
@end
