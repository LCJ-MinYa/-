//
//  LCJMineViewController.m
//  百思不得姐
//
//  Created by minya on 2017/8/23.
//  Copyright © 2017年 LiChaoJun. All rights reserved.
//

#import "LCJMineViewController.h"
#import "LCJNavButtonItem.h"

@interface LCJMineViewController ()

@end

@implementation LCJMineViewController

#pragma mark 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = LCJCommonBgColor;
    
    //标题
    self.navigationItem.title = @"我的关注";
    //右边设置按钮
    UIBarButtonItem * settingItem = [LCJNavButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingButtonClick)];
    
    //右边moon按钮
    UIBarButtonItem * moonItem = [LCJNavButtonItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(moonButtonClick)];
    
    self.navigationItem.rightBarButtonItems = @[settingItem, moonItem];
}

#pragma mark 右侧设置按钮点击事件
-(void)settingButtonClick
{
    LCJLog(@"点击设置按钮");
}

#pragma mark 右侧moon按钮点击事件
-(void)moonButtonClick
{
    LCJLog(@"点击moon按钮");
}

@end
