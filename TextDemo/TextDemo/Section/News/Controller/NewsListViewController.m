//
//  NewsListViewController.m
//  TextDemo
//
//  Created by shown on 16/11/14.
//  Copyright © 2016年 shown. All rights reserved.
//

#import "NewsListViewController.h"
#import "NewsModel.h"
#import "NewsListNetApi.h"

@interface NewsListViewController ()

@end

@implementation NewsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"消息";
//    NSDictionary *parms = @{
//                            @"user" : @"100"
//                            };
//    [AFHTTPClient getJSONPath:@"/shf/api/article/list" Params:parms Successed:^(id object) {
//        
//        NSDictionary *responseObject = object;
//        NSArray *arr = [NewsModel mj_objectArrayWithKeyValuesArray:responseObject[@"datasource"]];
//        
//        [WHC_ModelSqlite inserts:arr];   // 把数据缓冲到数据库
//        
//    } Failed:^(id error) {
//        NSLog(@"------%@--------",error);
//    }];
    
    
    NewsListNetApi *api = [[NewsListNetApi alloc]initWithUserId:@"100"];
    
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
         NSArray *arr = [NewsModel mj_objectArrayWithKeyValuesArray:[api getContent]];
        
         [WHC_ModelSqlite inserts:arr];   // 把数据缓冲到数据库
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
    }];
    
    
    
    
    
}
// 从本地数据库中获取保存的数据
- (IBAction)getDataFromSQL:(UIButton *)sender
{
    NSArray *data = [WHC_ModelSqlite query:[NewsModel class]];
    
    NSLog(@"------%ld----%@-",data.count,[WHC_ModelSqlite localPathWithModel:[NewsModel class]]);
    if (data.count>0)
    {
        [WHC_ModelSqlite removeAllModel];
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
