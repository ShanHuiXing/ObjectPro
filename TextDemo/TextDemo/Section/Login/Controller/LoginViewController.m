//
//  LoginViewController.m
//  TextDemo
//
//  Created by shown on 16/11/16.
//  Copyright © 2016年 shown. All rights reserved.
//

#import "LoginViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import "CLPlayerView.h"
@interface LoginViewController ()
{
    CLPlayerView *playerView;
}
/**
 *  控制视频播放的控件
 */
@property (weak, nonatomic) IBOutlet UISlider *progressSlider;
/**
 *  声明播放视频的控件属性[既可以播放视频也可以播放音频]
 */
@property (nonatomic,strong)AVPlayer *player;
/**
 *  播放的总时长
 */
@property (nonatomic,assign)CGFloat sumPlayOperation;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    playerView = [[CLPlayerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
    [self.view addSubview:playerView];
    //根据旋转自动支持全屏，默认支持
    //    playerView.autoFullScreen = NO;
    //重复播放，默认不播放
    //    playerView.repeatPlay     = YES;
    //如果播放器所在页面支持横屏，需要设置为Yes，不支持不需要设置(默认不支持)
    //    playerView.isLandscape    = YES;
    //http://120.25.226.186:32812/resources/videos/minion_01.mp4
    //视频地址
    playerView.url = [NSURL URLWithString:@"http://v.jxvdy.com/sendfile/w5bgP3A8JgiQQo5l0hvoNGE2H16WbN09X-ONHPq3P3C1BISgf7C-qVs6_c8oaw3zKScO78I--b0BGFBRxlpw13sf2e54QA"];
    
    //播放
    [playerView playVideo];
    
    //返回按钮点击事件回调
    [playerView backButton:^(UIButton *button) {
        NSLog(@"返回按钮被点击");
       ///
   
       [self.navigationController popViewControllerAnimated:YES];
        
        
        
    }];
    
    //播放完成回调
    [playerView endPlay:^{
        NSLog(@"播放完成");
        //销毁播放器
        [playerView destroyPlayer];
        playerView = nil;
    }];


}


-(void)dealloc
{
    //销毁播放器
    [playerView destroyPlayer];
    playerView = nil;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [playerView destroyPlayer];
    playerView = nil;
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
