//
//  GuideViewController.m
//  projectManager
//
//  Created by 张永杰 on 15/3/16.
//  Copyright (c) 2015年 zorasun. All rights reserved.
//

#import "GuideViewController.h"
#import "AppDelegate.h"
@interface GuideViewController ()

@end

@implementation GuideViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.myScroll setPagingEnabled:YES];
    self.myScroll.showsVerticalScrollIndicator =NO;
    self.myScroll.showsHorizontalScrollIndicator=NO;
    self.myScroll.bounces=NO;
    self.myScroll.contentSize=CGSizeMake(SCREEN_WIDTH*4, SCREEN_HEIGHT);
    for (int i=1; i<5; i++) {
        UIImageView *imageV=[[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*(i-1), 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        imageV.image=[UIImage imageNamed:[NSString stringWithFormat:@"guide%d.png",i]];
        if (i==4) {
            [imageV setUserInteractionEnabled:YES];
//            UIButton *btn=[UIButton buttonWithType:0];
//            //            btn.backgroundColor=[UIColor blueColor];
//            if (SCREEN_MAX_HEIGHT==568) {
//                btn.frame=CGRectMake(71, 300, 175, 45);
//            }
//            else if (SCREEN_MAX_HEIGHT==480){
//                btn.frame=CGRectMake(71, 253, 175, 40);
//            }
//            else{
//                
//            }
//            btn.backgroundColor=[UIColor clearColor];
//            [btn addTarget:self action:@selector(intoLogin) forControlEvents:UIControlEventTouchUpInside];
//            [image addSubview:btn];
            UITapGestureRecognizer *tapG=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
            [imageV addGestureRecognizer:tapG];
        }
        [self.myScroll addSubview:imageV];
    }
    [self.view addSubview:self.myScroll];

}
-(void)intoMainPage
{
    AppDelegate *app=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    [app setRootViewController];//切换跟视图
    
}
-(void)tapAction:(UITapGestureRecognizer *)sender
{
    if ([sender state] == UIGestureRecognizerStateEnded) {
        [self intoMainPage];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
