//
//  ZBaseTabBarController.m
//  ZFramework
//
//  Created by 郑辉煌 on 15/6/4.
//  Copyright (c) 2015年 anu. All rights reserved.
//

#import "ZBaseTabBarController.h"

#import "ZBaseTabBarView.h"

@interface ZBaseTabBarController ()<ZBaseTabbarDelegate>

@end

@implementation ZBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTabbar];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    [self.customerTabBar removeFromSuperview];
    self.customerTabBar = nil;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}
-(void)viewWillLayoutSubviews{
    
    [super viewWillLayoutSubviews];
    for (UIView *child in self.tabBar.subviews) {
        
        if ([child isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            [child removeFromSuperview];
            
        }
        
    }
}
/**
 *  监听tabbar按钮的改变
 *  @param from   原来选中的位置
 *  @param to     最新选中的位置
 */
-(void)tabBar:(ZBaseTabBarView *)tabBar didSelectButtonFrom:(long)from to:(long)to
{
    if (from==to)
    {
        return;
    }
    self.selectedIndex = to;
}

-(void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [super setSelectedIndex:selectedIndex];
    [self.customerTabBar setSelectedIndex:selectedIndex];
}

/**
 *  设置tabbar
 */
-(void)setupTabbar
{
    //完全自定义视图模式 //可以自定义高度 大小
    /*
     ZBaseTabBarView *customTabBar = [[ZBaseTabBarView alloc]initWithSystemTabbar:self.tabBar];
     customTabBar.delegate = self;
     CGRect rect=self.tabBar.frame;
     rect.size.height+=50;
     rect.origin.y-=200;
     customTabBar.frame=rect;
     customTabBar.backgroundColor = [UIColor blackColor];
     [self.view addSubview:customTabBar];
     self.customerTabBar = customTabBar;
     [self.tabBar removeFromSuperview];
    */
    //在原先TAB 上添加视图模式，hidesBottomBarWhenPushed 会同步隐藏
    ZBaseTabBarView *customTabbar = [[ZBaseTabBarView alloc]initWithSystemTabbar:self.tabBar];
    [customTabbar setBackgroundColor:[UIColor clearColor]];
    customTabbar.delegate = self;
    customTabbar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:customTabbar];
    self.customerTabBar = customTabbar;
}

/**
 *  通过该方法初始化 tab一个控制器
 */
-(void)setChildNavigationController:(UINavigationController *)navc
{
    [self addChildViewController:navc];
    [self.customerTabBar addTabBarButtonWithItems:navc.tabBarItem];
}

@end
