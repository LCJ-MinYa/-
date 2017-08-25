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
}

#pragma mark 设置导航器相关
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

#pragma mark 设置提示文字
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

#pragma mark 设置提示图片
-(void)setHintImg
{
    UIImageView * image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header_cry_icon"]];
    [image sizeToFit];
    image.lcj_centerX = SCREEN_WIDTH / 2;
    image.lcj_centerY = self.label.frame.origin.y - 24 - 20;
    LCJLog(@"%@", NSStringFromCGRect(image.frame));
    [self.view addSubview:image];
}

#pragma mark 左侧按钮点击事件
-(void)leftButtonClick
{
    LCJLog(@"点击左侧按钮");
}

@end
