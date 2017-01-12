//
//  HomeViewController.m
//  TextDemo
//
//  Created by shown on 16/11/14.
//  Copyright © 2016年 shown. All rights reserved.
//

#import "HomeViewController.h"
#import "LoginViewController.h"

@interface HomeViewController ()<SRWebSocketDelegate>
{
    SRWebSocket *_webSocket;
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"首页";

    
    _webSocket.delegate = nil;
    [_webSocket close];
//    _webSocket = [[SRWebSocket alloc]initWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"ws://192.168.2.215:8080/aiyi/webSocketServer"]]];
//    _webSocket.delegate = self;
//    [_webSocket open];
    
   
}

-(void)webSocketDidOpen:(SRWebSocket *)webSocket
{
    NSLog(@"-----open----");
    [_webSocket send:@"test success"];
}
-(void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error
{
    NSLog(@"-----fail---%@-",error.description);
}
-(void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message
{
    NSLog(@"-----message----%@---",message);
}
-(void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean
{
    ////这里只有当你主动的去关闭时才会调用
    _webSocket.delegate = nil;
    NSLog(@"-----close-------");
}

-(void)webSocket:(SRWebSocket *)webSocket didReceivePong:(NSData *)pongPayload
{
 
}

- (IBAction)loginAction:(id)sender
{
    LoginViewController *loginVC = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    
    loginVC.wantsNavigationBarVisible = NO;
    
    [self.navigationController pushViewController:loginVC animated:YES];
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
