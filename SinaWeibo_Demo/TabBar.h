//
//  TabBar.h
//  Test
//
//  Created by admin on 16/1/19.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TabBar;
//1.定义代理协议
@protocol TabBarDelegate <UITabBarDelegate>

//2.定义代理方法
@optional
- (void)addBtnDidClick:(TabBar *)tabBar;

@end


@interface TabBar : UITabBar

//3.定义代理属性
@property (weak, nonatomic) id <TabBarDelegate> delegate;

@end
