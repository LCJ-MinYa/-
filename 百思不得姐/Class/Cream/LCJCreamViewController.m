//
//  LCJCreamViewController.m
//  百思不得姐
//
//  Created by minya on 2017/8/23.
//  Copyright © 2017年 LiChaoJun. All rights reserved.
//

#import "LCJCreamViewController.h"
#import "LCJNavButtonItem.h"

@interface LCJCreamViewController ()

@end

@implementation LCJCreamViewController

#pragma mark 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航器相关
    [self setNav];
    
    //设置scrollView
    [self setScrollView];
    
    //设置titleView
    [self setTitleView];
}

#pragma mark 设置导航器相关[UI]
-(void)setNav
{
    //设置背景颜色
    self.view.backgroundColor = LCJCommonBgColor;
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    //左边按钮
    UIBarButtonItem * leftButton = [LCJNavButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(leftButtonClick)];
    self.navigationItem.leftBarButtonItems = @[leftButton];
}

#pragma mark 设置ScrollView[UI]
-(void)setScrollView
{
    UIScrollView * scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = LCJRandomColor;
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
}

#pragma mark 设置titleView[UI]
-(void)setTitleView
{
    UIView * titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 35)];
    titleView.backgroundColor = LCJColorAlpha(255, 255, 255, 0.6);
    [self.view addSubview:titleView];
    
    //添加标题
    NSArray * titles = @[@"全部", @"视频", @"声音", @"图片", @"段子"];
    NSUInteger count = titles.count;
    CGFloat titleButtonW = titleView.lcj_width / count;
    CGFloat titleButtonH = titleView.lcj_height;
    for (NSUInteger i=0; i<count; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.frame = CGRectMake(i * titleButtonW, 0, titleButtonW, titleButtonH);
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [titleView addSubview:button];
    }
}

#pragma mark 标题按钮点击事件
-(void)titleBtnClick:(UIButton *)button
{
    LCJLog(@"点击标题按钮");
}

#pragma mark 左侧按钮点击事件
-(void)leftButtonClick
{
    LCJLog(@"点击左侧按钮");
}

@end
