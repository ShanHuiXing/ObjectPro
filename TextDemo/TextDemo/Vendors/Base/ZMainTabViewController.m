//
//  ZMainTabViewController.m
//  ZFramework
//
//  Created by 郑辉煌 on 15/6/7.
//  Copyright (c) 2015年 anu. All rights reserved.
//

#import "ZMainTabViewController.h"
#import "AppNavigationController.h"
#import "HomeViewController.h"
#import "NewsListViewController.h"
#import "ClinicaListViewController.h"
#import "MyCenterViewController.h"

@interface ZMainTabViewController ()

@end

@implementation ZMainTabViewController

NSString *const kTabFirstImageN = @"ic_office_n";
NSString *const kTabFirstImageP = @"ic_office_p";

NSString *const kTabSecondImageN = @"ic_new_n";
NSString *const kTabSecondImageP = @"ic_new_p";

NSString *const kTabThirdImageN = @"ic_contact_n";
NSString *const kTabThirdImageP = @"ic_contact_p";

NSString *const kTabFourImageN = @"ic_user_n";
NSString *const kTabFourImageP = @"ic_user_p";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createSubViewControllers];
}

#pragma mark
-(void)createSubViewControllers
{
    
    HomeViewController * homeVC=[[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
    AppNavigationController *firstNavc=[[AppNavigationController alloc]initWithRootViewController:homeVC];
    firstNavc .tabBarItem.title=@"首页";
    firstNavc.tabBarItem.image = [UIImage imageNamed:kTabFirstImageN];
    firstNavc.tabBarItem.selectedImage=[UIImage imageNamed:kTabFirstImageP];
    [self setChildNavigationController:firstNavc];
    homeVC=nil;
    
    NewsListViewController *newsListVC = [[NewsListViewController alloc]initWithNibName:@"NewsListViewController" bundle:nil];
    AppNavigationController *secondNavc = [[AppNavigationController alloc]initWithRootViewController:newsListVC];
    secondNavc .tabBarItem.title=@"消息";
    secondNavc.tabBarItem.image= [UIImage imageNamed:kTabSecondImageN];
    secondNavc.tabBarItem.selectedImage=[UIImage imageNamed:kTabSecondImageP];
    [self setChildNavigationController:secondNavc];
    newsListVC = nil;
    
    ClinicaListViewController *clinicaVC=[[ClinicaListViewController alloc]initWithNibName:@"ClinicaListViewController" bundle:nil];
    AppNavigationController *thirdNavc=[[AppNavigationController alloc]initWithRootViewController:clinicaVC];
    thirdNavc .tabBarItem.title=@"问诊";
    thirdNavc.tabBarItem.image= [UIImage imageNamed:kTabThirdImageN];
    thirdNavc.tabBarItem.selectedImage=[UIImage imageNamed:kTabThirdImageP];
    [self setChildNavigationController:thirdNavc];
    clinicaVC=nil;
    
    MyCenterViewController *centerVC=[[MyCenterViewController alloc]initWithNibName:@"MyCenterViewController" bundle:nil];
    centerVC.wantsNavigationBarVisible = NO;
    AppNavigationController *fivethNavc=[[AppNavigationController alloc]initWithRootViewController:centerVC];
    fivethNavc .tabBarItem.title=@"我的";
    fivethNavc.tabBarItem.image= [UIImage imageNamed:kTabFourImageN];
    fivethNavc.tabBarItem.selectedImage=[UIImage imageNamed:kTabFourImageP];
    [self setChildNavigationController:fivethNavc];
    centerVC = nil;
    
    firstNavc=nil;
    secondNavc=nil;
    thirdNavc=nil;
    fivethNavc = nil;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
