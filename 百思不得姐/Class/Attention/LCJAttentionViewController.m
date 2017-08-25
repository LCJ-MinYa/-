//
//  LCJAttentionViewController.m
//  百思不得姐
//
//  Created by minya on 2017/8/23.
//  Copyright © 2017年 LiChaoJun. All rights reserved.
//

#import "LCJAttentionViewController.h"
#import "LCJNavButtonItem.h"
#import "LCJLoginViewController.h"

@interface LCJAttentionViewController ()

@property (nonatomic, weak) UILabel * label;

@end

@implementation LCJAttentionViewController

#pragma mark 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航器相关
    [self setNav];

    //提示文字
    [self setHintText];
    
    //提示图片
    [self setHintImg];
    
    //登陆注册按钮
    [self setBtn];
}

#pragma mark 设置导航器相关[UI]
-(void)setNav
{
    //设置背景颜色
    self.view.backgroundColor = LCJCommonBgColor;
    
    //标题
    self.navigationItem.title = @"我的关注";
    
    //左边按钮
    UIBarButtonItem * leftButton = [LCJNavButtonItem itemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(leftButtonClick)];
    self.navigationItem.leftBarButtonItems = @[leftButton];
}

#pragma mark 设置提示文字[UI]
-(void)setHintText
{
    //提示文字
    UILabel * label = [[UILabel alloc] init];
    label.numberOfLines = 0;
    label.text = @"快快登录吧，关注百思最in牛人\n好友动态让你过把瘾儿\n欧耶～～～！";
    label.textColor = LCJColor(50, 50, 50);
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentCenter;
    CGSize size = [label sizeThatFits:CGSizeMake(SCREEN_WIDTH * 0.7, MAXFLOAT)];
    label.frame = CGRectMake(0, 0, size.width, size.height);
    label.center = CGPointMake(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2);
    self.label = label;
    [self.view addSubview:label];
}

#pragma mark 设置提示图片[UI]
-(void)setHintImg
{
    UIImageView * image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header_cry_icon"]];
    [image sizeToFit];
    image.lcj_centerX = SCREEN_WIDTH / 2;
    image.lcj_centerY = self.label.frame.origin.y - 24 - 20;
    LCJLog(@"%@", NSStringFromCGRect(image.frame));
    [self.view addSubview:image];
}

#pragma mark 设置登录注册button[UI]
-(void)setBtn
{
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 0.6, 30)];
    btn.center = CGPointMake(SCREEN_WIDTH / 2, self.label.frame.origin.y + self.label.frame.size.height + 25 + 20);
    btn.backgroundColor = [UIColor whiteColor];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn setTitle:@"立即登录注册" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(buttonHighlighted:) forControlEvents:UIControlEventTouchDown];
    [btn addTarget:self action:@selector(buttonNormal:) forControlEvents:UIControlEventTouchUpInside];
    [btn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

#pragma mark 设置登录注册高亮背景颜色
-(void)buttonHighlighted:(UIButton *)sender
{
    sender.backgroundColor = [UIColor redColor];
}

#pragma mark 设置登录注册普通背景颜色
-(void)buttonNormal:(UIButton *)sender
{
    sender.backgroundColor = [UIColor whiteColor];
}

#pragma mark 设置登录注册点击事件
-(void)buttonClick
{
    LCJLog(@"点击登录注册按钮");
    LCJLoginViewController * login = [[LCJLoginViewController alloc] init];
    [self presentViewController:login animated:YES completion:nil];
}

#pragma mark 左侧按钮点击事件
-(void)leftButtonClick
{
    LCJLog(@"点击左侧按钮");
}

@end
