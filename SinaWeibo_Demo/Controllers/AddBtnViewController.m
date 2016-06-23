
//
//  AddBtnViewController.m
//  Test
//
//  Created by admin on 16/1/19.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "AddBtnViewController.h"
#import "UIView+Extension.h"

@interface AddBtnViewController ()

@end
@implementation AddBtnViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label =  [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
    label.text = @"点击任何地方dismiss";
    label.center = self.view.center;
    [self.view addSubview:label];
  
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
