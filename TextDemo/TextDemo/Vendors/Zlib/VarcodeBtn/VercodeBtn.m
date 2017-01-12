//
//  VercodeBtn.m
//  ZXHT
//
//  Created by Future on 14-8-23.
//  Copyright (c) 2014年 xiamenzhuoxuncompany. All rights reserved.
//

#import "VercodeBtn.h"

@implementation VercodeBtn

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)setBtnNOEnableWihtTime:(int)time
{
       _countTime=time;
    self .enabled=NO;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerStar:) userInfo:nil repeats:YES];
    
}

-(void)setHighlighted:(BOOL)highlighted
{
}

-(void)dealloc
{
    
    [_timer invalidate];
    _timer=nil;
}
-(void)setISEnabled:(BOOL)ISEnabled
{
    if (_isLoopStatus) {
        _ISEnabled = NO;
        self.enabled=NO;
    }
    else
    {
        _ISEnabled=ISEnabled;
        self.enabled=ISEnabled;
    }
}
-(void)timerStar:(NSTimer *)timer
{
    ;
    if (_countTime>1) {
        _countTime--;
        NSMutableAttributedString *content = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%d秒后重新发送",_countTime]];
//        NSRange contentRange = {0,[content length]};
//        [content addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleThick] range:contentRange];
        [self setAttributedTitle:content forState:UIControlStateNormal];
        //        self.titleLabel.text=[NSString stringWithFormat:@"%d秒",_countTime];
        [self.titleLabel setAttributedText:content];
        [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [self.titleLabel setFont:[UIFont systemFontOfSize:12]];
        _isLoopStatus=YES;
        return;
    }
    else
    {   self.enabled=YES;
        NSMutableAttributedString *content = [[NSMutableAttributedString alloc]initWithString:@"获取验证码"];
//        NSRange contentRange = {0,[content length]};
//        [content addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleThick] range:contentRange];
        //        [self.titleLabel setAttributedText:content];
        [self setAttributedTitle:content forState:UIControlStateNormal];
        [self.titleLabel setFont:[UIFont systemFontOfSize:15]];
        _isLoopStatus=NO;
        [_timer invalidate];
    }
    
}
-(void)resumeBtn
{
    
}
//还原按钮，回复可点击状态
-(void)revover
{
    _countTime=0;
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
