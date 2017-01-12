//
//  PopToastView.m
//  ZXHT
//
//  Created by Future on 14-7-24.
//  Copyright (c) 2014年 xiamenzhuoxuncompany. All rights reserved.
//

#import "PopToastView.h"
#define SELFHEIGHT 30
#define SELFPADDING 20
#define SELFHEIHTPADDING 5

@implementation PopToastView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-100, [UIScreen mainScreen].bounds.size.height, 200, SELFHEIGHT)];
        [self.layer setCornerRadius:3.0f];
        [self.layer setMasksToBounds:YES];
        
         self.backgroundColor=[UIColor blackColor];
        _imagev=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_prompt_box"]];
    
        _label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, SELFHEIGHT)];
    }
    return self;
}
static PopToastView * instance;
+ (PopToastView *)sharedInstance{
    static dispatch_once_t  onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[PopToastView alloc] init];
    });
    instance.offsetX = 0;
    instance.offsetY = 0;
    return instance;
}
+ (id) allocWithZone:(NSZone *)zone //单例重写allocWithZone方法，alloc不产生新的势力
{
    @synchronized (self) {
        if (instance == nil) {
            instance = [super allocWithZone:zone];
            return instance;
        }
    }
    return nil;
}
-(void)popShowWithTitle:(NSString *)title AndTime:(float )time
{
  // title=@"支付订金超过十五分钟不能申请退订请联系卖家协商";
    _label.text=title;
    [_label setFont:[UIFont systemFontOfSize:15]];
    [_label setTextColor:[UIColor whiteColor]];
    [_label setTextAlignment:NSTextAlignmentCenter];
    _label.lineBreakMode = NSLineBreakByWordWrapping;// UILineBreakModeWordWrap;
    _label.numberOfLines = 0;
  
  
    
    CGSize contentLabelSize = [_label.text sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(180, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    //长度最大值、高度最大值
//    label.text boundingRectWithSize:(CGSize) options:<#(NSStringDrawingOptions)#> attributes:<#(NSDictionary *)#> context:(NSStringDrawingContext *)
   // NSLog(@"%f,%f",contentLabelSize.width,contentLabelSize.height);
    
    int width=contentLabelSize.width+SELFHEIHTPADDING;
    int height=contentLabelSize.height+SELFHEIHTPADDING;
    if(height<SELFHEIGHT)
    {
        height=SELFHEIGHT;
    }
    
    [_imagev setFrame:CGRectMake(0, 0, width, height)];
    [_label setFrame:CGRectMake(0, 0, width, height)];
    [self addSubview:_imagev];
    [self addSubview:_label];

    
    [self setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-width/2 + self.offsetX, [UIScreen mainScreen].bounds.size.height-49-50 + self.offsetY, width, height)];

    
    CABasicAnimation * animation1=[CABasicAnimation  animationWithKeyPath:@"opacity"];//模糊动画
	[animation1 setFromValue:[NSNumber numberWithFloat:0.5]];//设置开始值为 1.0
    [animation1 setToValue:[NSNumber numberWithInt:1]];
    [animation1 setDuration:1];
    //	animation setRepeatCount:3.0];//设置重复时间3秒
    //    [animation2 setDelegate:self];
    [animation1 setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    //	[animation setAutoreverses:YES];//设置恢复//默认的是NO，即透明完毕后立马恢复，YES是延迟恢复
//   [self.layer  addAnimation:animation1 forKey:@"img-opacity"];
 


    CABasicAnimation * animation2=[CABasicAnimation  animationWithKeyPath:@"opacity"];//模糊动画
	[animation2 setFromValue:[NSNumber numberWithFloat:1]];//设置开始值为 1.0
    [animation2 setToValue:[NSNumber numberWithInt:0.5]];
    [animation2 setDuration:time];
    [animation2 setCumulative:YES];
    //	animation setRepeatCount:3.0];//设置重复时间3秒
    [animation2 setDelegate:self];
    [animation2 setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [animation2 setBeginTime:1];
    //	[animation setAutoreverses:YES];//设置恢复//默认的是NO，即透明完毕后立马恢复，YES是延迟恢复
//    [self.layer  addAnimation:animation2 forKey:@"img-opacity"];

    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
	animationGroup.duration = 1+time;
    animationGroup.delegate=self;
//	animationGroup.autoreverses = YES;
//	animationGroup.repeatCount = HUGE_VALF;
	[animationGroup setAnimations:[NSArray arrayWithObjects:animation1,animation2, nil]];
    [self.layer addAnimation:animationGroup forKey:@"animationGroup"];
    
    UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
    
    
    [window addSubview:self];
    
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag;
{
   // NSLog(@" 动画结束 ");
//    [self removeFromSuperview];
    self .alpha=0;
}

//-(void)doOpacity//图片模糊变化
//{
//	NSLog(@"%s",__FUNCTION__);
//	CABasicAnimation * animation=[CABasicAnimation  animationWithKeyPath:@"opacity"];//模糊动画
//	[animation setFromValue:[NSNumber numberWithFloat:1.0]];//设置开始值为 1.0
//    [animation setToValue:[NSNumber numberWithInt:0.0]];
//    [animation setDuration:3.0];
//	[animation setRepeatCount:3.0];//设置重复时间3秒
//    [animation setDelegate:self];
//	[animation setAutoreverses:YES];//设置恢复//默认的是NO，即透明完毕后立马恢复，YES是延迟恢复
//    [bigImage.layer  addAnimation:animation forKey:@"img-opacity"];
//}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
