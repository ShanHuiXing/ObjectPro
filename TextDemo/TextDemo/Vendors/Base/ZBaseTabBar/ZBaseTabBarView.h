//
//  ZBaseTabBarView.h
//  ZFramework
//
//  Created by 郑辉煌 on 15/6/7.
//  Copyright (c) 2015年 anu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZBaseTabBarView;
@class ZBaseTabBarBtn;
@protocol ZBaseTabbarDelegate <NSObject>
@optional
/**
 *  工具栏按钮被选中，记录从哪里跳转到哪里。I（方便以后做相应特效）
 */
-(void)tabBar:(ZBaseTabBarView *)tabBar didSelectButtonFrom:(long)from to:(long)to;

@end

@interface ZBaseTabBarView : UIView
@property (nonatomic,strong)NSMutableArray *tabbarButtons;
@property (nonatomic,weak)ZBaseTabBarBtn *selectedButton;
@property (nonatomic, weak) id<ZBaseTabbarDelegate> delegate;

-(void)addTabBarButtonWithItems:(UITabBarItem *)item;
-(instancetype)initWithSystemTabbar:(UITabBar *)tabbar;
-(void)setSelectedIndex:(NSInteger)index;
@end
