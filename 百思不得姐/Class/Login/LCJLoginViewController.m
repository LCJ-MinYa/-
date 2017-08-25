//
//  LCJLoginViewController.m
//  百思不得姐
//
//  Created by minya on 2017/8/25.
//  Copyright © 2017年 LiChaoJun. All rights reserved.
//

#import "LCJLoginViewController.h"

@interface LCJLoginViewController ()

@end

@implementation LCJLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航器相关
    [self setNav];
}

#pragma mark 设置状态栏文本颜色
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark 设置导航器相关[UI]
-(void)setNav
{
    //设置背景颜色
    UIImage * backGroundImage=[UIImage imageNamed:@"login_register_background"];
    self.view.contentMode = UIViewContentModeScaleAspectFill;
    self.view.layer.contents = (__bridge id _Nullable)(backGroundImage.CGImage);
}

@end
