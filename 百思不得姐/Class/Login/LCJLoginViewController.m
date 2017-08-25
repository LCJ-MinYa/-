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
    
    //顶部关闭和切换注册登录
    
    //第三方登录view
    [self setThirdPartyLogin];
}

#pragma mark 设置状态栏文本颜色
/*
 *  -(BOOL)prefersStatusBarHidden
 *  控制状态栏是否显示
 */
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

#pragma mark 设置第三方登录[UI]
-(void)setThirdPartyLogin
{
    UIView * thirdPartyLoginView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 180, SCREEN_WIDTH, 150)];
    thirdPartyLoginView.backgroundColor = [UIColor clearColor];
    
    UIView * thirdPartyLoginTitle = [self setThirdPartyLoginTitle];
    [thirdPartyLoginView addSubview:thirdPartyLoginTitle];
    [self.view addSubview:thirdPartyLoginView];
}

#pragma mark 设置第三方登录标题[UI]
-(UIView *)setThirdPartyLoginTitle
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    
    //创建标题
    UILabel * title = [[UILabel alloc] init];
    title.text = @"快速登录";
    title.font = [UIFont systemFontOfSize:14];
    [title setTextColor:[UIColor whiteColor]];
    [title sizeToFit];
    title.center = CGPointMake(SCREEN_WIDTH / 2, 15);
    [view addSubview:title];
    LCJLog(@"%@", NSStringFromCGRect(title.frame));
    
    //左边线
    UIImageView * leftImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_register_left_line"]];
    [leftImg sizeToFit];
    LCJLog(@"%@", NSStringFromCGRect(leftImg.frame));
    [view addSubview:leftImg];
    
    return view;
}

@end
