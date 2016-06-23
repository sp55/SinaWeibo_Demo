//
//  TabBar.m
//  Test
//
//  Created by admin on 16/1/19.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "TabBar.h"
#import "UIView+Extension.h"


@interface TabBar ()
@property (strong, nonatomic) UIButton *addBtn;
@end

@implementation TabBar
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        //初始化中间加号按钮
        UIButton *addBtn = [[UIButton alloc]init];
        [addBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [addBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [addBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [addBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        addBtn.size = addBtn.currentBackgroundImage.size;
        [addBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
        self.addBtn = addBtn;
        [self addSubview:addBtn];
        
    }
    return self;
}
/**
 *  中间按钮的点击方法
 */
- (void)addBtnClick{
    
//    if ([self.delegate respondsToSelector:@selector(addBtnDidClick:)]) {
        [self.delegate addBtnDidClick:self];
//    }
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    //中间加号按钮的位置
    self.addBtn.centerX= self.width * 0.5;
    self.addBtn.centerY = self.height * 0.5;
    
    //重新布局tabBar上的tabBarItem
    CGFloat tabBarItemWidth = self.width / 5;
    CGFloat tabBarItemIndex = 0;
    for (UIView *childItem in self.subviews) {
        if ([childItem isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            childItem.width = tabBarItemWidth;
            
            childItem.x = tabBarItemIndex*tabBarItemWidth;
            tabBarItemIndex ++;
            if (tabBarItemIndex == 2) {
                tabBarItemIndex ++;
            }
        }
    }
}

@end
