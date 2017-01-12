//
//  ZBaseViewController.m
//  ZFramework
//
//  Created by 郑辉煌 on 15/6/4.
//  Copyright (c) 2015年 anu. All rights reserved.
//

#import "ZBaseViewController.h"

@interface ZBaseViewController ()

@end

@implementation ZBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=YES;
    //消除界面被导航栏遮挡
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]){
        
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}

-(void)setBackBtn{};

-(void)backAction:(id)sender{};

-(void)setRightBtn:(UIButton *)button WithTapBlock:(RightBtnBlock)tapBlock
{
    _rightBtnBlock=tapBlock;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    [button addTarget:self action:@selector(rightBtnBlock) forControlEvents:UIControlEventTouchUpInside];
}

-(void)rightBrnAction:(id)sender
{
    if (_rightBtnBlock) {
        _rightBtnBlock(sender);
    }
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
