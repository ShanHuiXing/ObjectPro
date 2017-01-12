//
//  AppNavigationController.m
//  ZorasunProduct
//
//  Created by linxiao song on 15/2/10.
//  Copyright (c) 2015年 iFuture. All rights reserved.
//

#import "AppNavigationController.h"

@interface AppNavigationController ()

@end

@implementation AppNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationStyle];
    
    //去除黑线
//    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//设置样式 
-(void)setNavigationStyle
{
  //返回按钮字体的颜色
  // title颜色
    NSDictionary *attributes=@{
                               NSFontAttributeName : [UIFont systemFontOfSize:18],
                               NSForegroundColorAttributeName : [UIColor whiteColor]
                               };
    
    [self.navigationBar setTitleTextAttributes:attributes];
    self.navigationBar.barTintColor = [UIColor colorWithRed:67/255.0 green:164/255.0 blue:223/255.0 alpha:1.0];
//    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_title_nav"] forBarMetrics:UIBarMetricsDefault];

}


/** 
 *  为了让PUSH的时候左侧栏不可滑动
 *
 * 
 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
    if (self.viewControllers.count>1) {
//        disableRESideMenu
    }else{
//        enableRESideMenu
    }
}

@end
