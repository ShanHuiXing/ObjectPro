//
//  VercodeBtn.h
//  ZXHT
//
//  Created by Future on 14-8-23.
//  Copyright (c) 2014年 xiamenzhuoxuncompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VercodeBtn : UIButton//倒计时按钮
{
//    NSTimer *_timer;
    int _countTime;
}
-(void)setBtnNOEnableWihtTime:(int)time;
@property (nonatomic,strong)NSTimer *timer;
@property(nonatomic,assign)BOOL isLoopStatus;//是否处于倒计时状态,用于保证处于倒计时状态的时候，按钮不可点击
@property(nonatomic,assign) BOOL ISEnabled;//重写的enable
///恢复按钮到普通状态
-(void)revover;
@end
