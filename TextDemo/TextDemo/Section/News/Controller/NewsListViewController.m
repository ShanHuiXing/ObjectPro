//
//  NewsListViewController.m
//  TextDemo
//
//  Created by shown on 16/11/14.
//  Copyright © 2016年 shown. All rights reserved.
//

#import "NewsListViewController.h"

@interface NewsListViewController ()

@end

@implementation NewsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"消息";
    NSDictionary *parms = @{
                            @"user" : @"100"
                            };
    [AFHTTPClient getJSONPath:@"/shf/api/article/list" Params:parms Successed:^(id object) {
        
        
        
    } Failed:^(id error) {
        NSLog(@"------%@--------",error);
    }];
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
