//
//  ZBaseNavigationController.m
//  ZFramework
//
//  Created by 郑辉煌 on 15/6/4.
//  Copyright (c) 2015年 anu. All rights reserved.
//

#import "ZBaseNavigationController.h"

@interface ZBaseNavigationController ()
@property (nonatomic,weak) UIViewController *currentShowVC;
@end

@implementation ZBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置侧滑返回手势可用
    __weak __typeof(&*self)weakSelf = self;
    self.delegate=self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//返回动画的时候，禁用侧滑返回手势
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self.view endEditing:YES];//强制收起键盘，防止IQKeyboard的IOS7 中的BUG，导致navicontroller错乱
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    //大于一级  自动隐藏tabbar
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:YES];
}

//视图push完成以后，恢复使用侧滑手势
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UIViewController *topVc =[self.viewControllers objectAtIndex:0];//顶层VC 禁用侧滑返回
    if (viewController == topVc) {
        navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    else
    {
        if ([navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            navigationController.interactivePopGestureRecognizer.enabled = YES;
        }
    }
}


- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    [self.view endEditing:YES];//强制收起键盘，防止IQKeyboard的IOS7 中的BUG，导致navicontroller错乱
    return [super popViewControllerAnimated:animated];
}
- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self.view endEditing:YES];//强制收起键盘，防止IQKeyboard的IOS7 中的BUG，导致navicontroller错乱
    return [super popToViewController:viewController animated:animated];
}
- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated
{
    [self.view endEditing:YES];//强制收起键盘，防止IQKeyboard的IOS7 中的BUG，导致navicontroller错乱
    return   [super popToRootViewControllerAnimated:animated];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
