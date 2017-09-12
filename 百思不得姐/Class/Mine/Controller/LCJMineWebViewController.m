//
//  LCJMineWebViewController.m
//  百思不得姐
//
//  Created by CA on 2017/9/12.
//  Copyright © 2017年 LiChaoJun. All rights reserved.
//

#import "LCJMineWebViewController.h"

@interface LCJMineWebViewController ()

@end

@implementation LCJMineWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航器相关
    [self setNav];
    
    //显示webview
    [self setWebView];
}

#pragma mark 设置导航器相关[UI]
-(void)setNav
{
    //设置背景颜色
    self.view.backgroundColor = LCJCommonBgColor;
    
    //标题
    self.navigationItem.title = self.name;
}

#pragma mark 设置webview[UI]
-(void)setWebView
{
    UIWebView * webview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    [self.view addSubview:webview];
}

@end
