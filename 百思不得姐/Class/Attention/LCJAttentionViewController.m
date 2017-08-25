//
//  LCJAttentionViewController.m
//  百思不得姐
//
//  Created by minya on 2017/8/23.
//  Copyright © 2017年 LiChaoJun. All rights reserved.
//

#import "LCJAttentionViewController.h"
#import "LCJNavButtonItem.h"

@interface LCJAttentionViewController ()

@end

@implementation LCJAttentionViewController

#pragma mark 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //标题
    self.navigationItem.title = @"我的关注";
    //左边按钮
    //左边按钮
    UIBarButtonItem * leftButton = [LCJNavButtonItem itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(leftButtonClick)];
    self.navigationItem.leftBarButtonItems = @[leftButton];
}

#pragma mark 左侧按钮点击事件
-(void)leftButtonClick
{
    LCJLog(@"点击左侧按钮");
}

@end
