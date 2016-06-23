//
//  TabBarViewController.m
//  Test
//
//  Created by admin on 16/1/19.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "TabBarViewController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "DiscoverViewController.h"
#import "ProfileViewController.h"
#import "AddBtnViewController.h"

#import "TabBar.h"
#import "NavigationController.h"


@implementation TabBarViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    //主页
    HomeViewController *home = [[HomeViewController alloc]init];
    [self addChildViewController:home image:@"tabbar_home" selectedImage:@"tabbar_home_selected" title:@"首页"];
    
    //消息
    MessageViewController *message = [[MessageViewController alloc]init];
    [self addChildViewController:message image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected" title:@"消息"];
    
    //发现
    DiscoverViewController *discover = [[DiscoverViewController alloc]init];
    [self addChildViewController:discover image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected" title:@"发现"];
    
    //我
    ProfileViewController *profile = [[ProfileViewController alloc]init];
    [self addChildViewController:profile image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected" title:@"我"];
    
    //tabBar
    TabBar *tabBar = [[TabBar alloc]init];
    [self setValue:tabBar forKeyPath:@"tabBar"];
    
}
/**
 *  添加子控制器
 *
 *  @param childViewController 子控制器
 *  @param image               tabBarItem正常状态图片
 *  @param selectedImage       tabBarItem选中状态图片
 *  @param title               标题
 */
- (void)addChildViewController:(UIViewController *)childViewController image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title {
    
    //标题
    childViewController.title = title;
    childViewController.view.backgroundColor = [UIColor whiteColor];
    
    //tabBarItem图片
    childViewController.tabBarItem.image = [UIImage imageNamed:image];
    childViewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //tabBarItem字体的设置
    //正常状态
    NSMutableDictionary *normalText = [NSMutableDictionary dictionary];
    normalText[NSForegroundColorAttributeName] = [UIColor colorWithRed:123/255.0 green:123/255.0 blue:123/255.0 alpha:1.0];
    [childViewController.tabBarItem setTitleTextAttributes:normalText forState:UIControlStateNormal];
    
    //选中状态
    NSMutableDictionary *selectedText = [NSMutableDictionary dictionary];
    selectedText[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childViewController.tabBarItem setTitleTextAttributes:selectedText forState:UIControlStateSelected];
    
    //导航控制器
    NavigationController *navgationVC = [[NavigationController alloc]initWithRootViewController:childViewController];
    
    [self addChildViewController:navgationVC];
}

/**
 *  addBtn 的代理方法
 *
 *  @param tabBar tabBar
 */
- (void)addBtnDidClick:(TabBar *)tabBar{
    
    AddBtnViewController *addBtnVC = [[AddBtnViewController alloc]init];
    addBtnVC.view.backgroundColor = [UIColor cyanColor];
    [self presentViewController:addBtnVC animated:YES completion:nil];
    
}

@end
