//
//  ZBaseTabBarView.m
//  ZFramework
//
//  Created by 郑辉煌 on 15/6/7.
//  Copyright (c) 2015年 anu. All rights reserved.
//

#import "ZBaseTabBarView.h"
#import "ZBaseTabBarBtn.h"
@interface ZBaseTabBarView()

@property (nonatomic,weak) UITabBar *systemBar;
@end

@implementation ZBaseTabBarView
-(instancetype)initWithSystemTabbar:(UITabBar *)tabbar
{
    if (self = [super init]) {
        _systemBar = tabbar;
        [_systemBar addObserver:self forKeyPath:@"isHidden" options:0 context:nil];
        self.backgroundColor = [UIColor colorWithRed:20/255.0 green:30/255.0 blue:60/255.0 alpha:1.0];
    }
    return self;
}

-(void)dealloc
{
    [_systemBar removeObserver:self forKeyPath:@"isHidden"];
}

-(void)addTabBarButtonWithItems:(UITabBarItem *)item
{
    ZBaseTabBarBtn *button = [[ZBaseTabBarBtn alloc]init];
    button.item = item;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:button];
    [self.tabbarButtons addObject:button];
    //默认选中第一个
    if (self.tabbarButtons.count == 1) {
        
//        button.contentEdgeInsets = UIEdgeInsetsMake(11, 0, 0, 0);
        [self buttonClick:button];
    }
}

-(void)buttonClick:(ZBaseTabBarBtn *)button
{
//    [button setBackgroundImage:[UIImage imageNamed:@"button_bg_n"] forState:UIControlStateSelected];
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectButtonFrom:self.selectedButton.tag to:button.tag];
    }
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat h = self.frame.size.height;
    CGFloat w = self.frame.size.width;
    CGFloat buttonH = h;
    CGFloat buttonW = w/self.subviews.count;
    CGFloat buttonY = 0;
    for (int i = 0; i< self.tabbarButtons.count; i++) {
        ZBaseTabBarBtn *button = self.tabbarButtons[i];
        CGFloat buttonX = i*buttonW;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        button.tag = i;
    }
}

-(NSMutableArray *)tabbarButtons
{
    if (_tabbarButtons == nil) {
        _tabbarButtons = [NSMutableArray array];
    }
    return  _tabbarButtons;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    self.hidden = _systemBar.hidden;
}

-(void)setSelectedIndex:(NSInteger)index
{
    if (index<_tabbarButtons.count) {
        self.selectedButton.selected=NO;
        ZBaseTabBarBtn *button= [_tabbarButtons objectAtIndex:index];
        button.selected = YES;
        self.selectedButton = button;
    }
}

@end
