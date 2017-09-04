//
//  LCJSettingViewController.m
//  百思不得姐
//
//  Created by minya on 2017/8/24.
//  Copyright © 2017年 LiChaoJun. All rights reserved.
//

#import "LCJSettingViewController.h"

@interface LCJSettingViewController ()

@end

@implementation LCJSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"设置";
    //设置背景颜色
    self.view.backgroundColor = LCJCommonBgColor;
    //self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"自定义" style:UIBarButtonItemStyleDone target:nil action:nil];
}

@end
