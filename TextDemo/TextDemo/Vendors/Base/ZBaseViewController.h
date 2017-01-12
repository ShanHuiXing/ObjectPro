//
//  ZBaseViewController.h
//  ZFramework
//
//  Created by 郑辉煌 on 15/6/4.
//  Copyright (c) 2015年 anu. All rights reserved.
//  视图基类

#import <UIKit/UIKit.h>

typedef void (^RightBtnBlock) (id sender);
@interface ZBaseViewController : UIViewController

// 设置nav返回按钮
-(void)setBackBtn;

// 返回按钮方法
-(void)backAction:(id)sender;

//x设置nav右边按钮
-(void)setRightBtn:(UIButton *)button WithTapBlock:(RightBtnBlock)tapBlock;

@property (nonatomic,copy) RightBtnBlock rightBtnBlock;
@end


