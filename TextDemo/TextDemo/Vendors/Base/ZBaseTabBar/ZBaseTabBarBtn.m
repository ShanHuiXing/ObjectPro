//
//  ZBaseTabBarBtn.m
//  ZFramework
//
//  Created by 郑辉煌 on 15/6/7.
//  Copyright (c) 2015年 anu. All rights reserved.
//

#import "ZBaseTabBarBtn.h"

@implementation ZBaseTabBarBtn

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)init
{
    if (self = [super init]) {
        [self setStyle];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setStyle];
    }
    return self;
}

-(void)setStyle
{
    self.imageView.contentMode = UIViewContentModeCenter;
//    [self setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    //文字居中
    self.titleLabel.textAlignment=NSTextAlignmentCenter;
    //字体大小
    self.titleLabel.font = [UIFont systemFontOfSize:11];
    [self setTitleColor:[UIColor colorWithRed:22.0/255 green:181.0/255 blue:255.0/255 alpha:1.0] forState:UIControlStateSelected];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

//  重写去掉高亮状态
-(void)setHighlighted:(BOOL)highlighted{}

//内部文字的frame
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat y = contentRect.size.height*0.6;
    CGFloat w = contentRect.size.width;
    CGFloat h = contentRect.size.height -y;
    return CGRectMake(0, y, w, h);
}

//  内部图片Frame
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat w = contentRect.size.width;
    CGFloat h = contentRect.size.height;
    CGFloat y = contentRect.origin.y;
    return CGRectMake(0, y-5, w, h);
}

-(void)setItem:(UITabBarItem *)item
{
    _item = item;
    //  kvo 监听属性变化
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

-(void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
    
}

/**
 *  监听到某个对象的属性改变了,就会调用
 *
 *  @param keyPath 属性名
 *  @param object  哪个对象的属性被改变
 *  @param change  属性发生的改变
 */
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    //  设置文字
    [self setTitle:self.item.title forState:UIControlStateSelected];
    [self setTitle:self.item.title forState:UIControlStateNormal];
    
    //  设置图片
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    
}



@end
