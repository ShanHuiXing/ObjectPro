//
//  AppBaseViewController.m
//  ZorasunProduct
//
//  Created by linxiao song on 15/2/10.
//  Copyright (c) 2015年 iFuture. All rights reserved.
//

#import "AppBaseViewController.h"

@interface AppBaseViewController ()

@end

@implementation AppBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self setBackBtn];
    
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self setBaseStyle];
    [self setLoginHandler];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//设置基础样式
-(void)setBaseStyle
{
//    self.view.backgroundColor=kAppBgColor;
    
}
#pragma mark设置返回按钮
-(void)setBackBtn
{
    
    //自定义左边按钮  如果是第一级视图则不添加按钮， 如果是present 视图，请自行添加按钮
    if (self.navigationController.viewControllers.count!=1) {
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftButton setImage:[UIImage imageNamed:@"nav_back_n"] forState:UIControlStateNormal];
        [leftButton setImage:[UIImage imageNamed:@"nav_back_n"] forState:UIControlStateHighlighted];
        [leftButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
        [leftButton setFrame: CGRectMake(0,0, 20,17)];
        [leftButton setContentEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
        //      self.navigationItem.backBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:leftButton];
    }
}
#pragma mark 返回上级一级的方法
-(void)backAction:(id)sender
{

    [self.navigationController popViewControllerAnimated:YES];

}
#pragma mrak  ______________关于登录跳转
#pragma mrak reloginnotefication
-(void)reLogin:(NSNotification *)notefication
{
//    AccountManager *manager=[AccountManager sharedInstance];
//    [manager resignMethod];
}
#pragma mrak 页面需要登录访问权限的，跳转到登录页面
-(void)setLoginHandler
{
//    if (self.isNeedLoginPermission) {// 如果需要登录权限，且未登录的，跳转到登录页面
//        AccountManager *manager=[AccountManager sharedInstance];
//        if (manager.user.userId==nil||[manager.user.userId isEqualToString:@""]) {
//            kReloginMethod
//        }
//    }
}

@end
