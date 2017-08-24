//
//  LCJTabBarController.m
//  百思不得姐
//
//  Created by minya on 2017/8/23.
//  Copyright © 2017年 LiChaoJun. All rights reserved.
//

#import "LCJTabBarController.h"
#import "LCJCreamViewController.h"
#import "LCJNewViewController.h"
#import "LCJAttentionViewController.h"
#import "LCJMineViewController.h"
#import "LCJTabBar.h"
#import "LCJNavigationController.h"

@implementation LCJTabBarController

#pragma mark - 程序初始化
-(void)viewDidLoad {
    [super viewDidLoad];
    [self creatAllNav];
}

#pragma mark - 创建所有子控制器
-(void)creatAllNav
{
    //设置所有UITabBarItem的文字属性
    UITabBarItem * item = [UITabBarItem appearance];
    //普通状态下的文字属性
    NSMutableDictionary * normalAttrs = [NSMutableDictionary dictionary];
    //normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    normalAttrs[NSForegroundColorAttributeName] = LCJColor(140, 132, 129);
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    //选中状态下的文字属性
    NSMutableDictionary * selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = LCJColor(81, 81, 81);
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    //添加第一个导航子控制器[精华]
    LCJNavigationController * cream = [[LCJNavigationController alloc] initWithRootViewController:[[LCJCreamViewController alloc] init]];
    [self creatNav:cream image:[UIImage imageNamed:@"tabBar_essence_icon"] selectImage:[UIImage imageNamed:@"tabBar_essence_click_icon"] title:@"精华"];
    
    //添加第二个导航子控制器[新帖]
    LCJNavigationController * new = [[LCJNavigationController alloc] initWithRootViewController:[[LCJNewViewController alloc] init]];
    [self creatNav:new image:[UIImage imageNamed:@"tabBar_new_icon"] selectImage:[UIImage imageNamed:@"tabBar_new_click_icon"] title:@"新帖"];
    
    //添加第三个导航子控制器[关注]
    LCJNavigationController * attention = [[LCJNavigationController alloc] initWithRootViewController:[[LCJAttentionViewController alloc] init]];
    [self creatNav:attention image:[UIImage imageNamed:@"tabBar_friendTrends_icon"] selectImage:[UIImage imageNamed:@"tabBar_friendTrends_click_icon"] title:@"关注"];
    
    //添加第四个导航子控制器[我]
    LCJNavigationController * mine = [[LCJNavigationController alloc] initWithRootViewController:[[LCJMineViewController alloc] init]];
    [self creatNav:mine image:[UIImage imageNamed:@"tabBar_me_icon"] selectImage:[UIImage imageNamed:@"tabBar_me_click_icon"] title:@"我"];
    
    [UITabBar appearance].barTintColor = LCJColor(255, 255, 255);
    
    //更换UITabBarController内部的TabBar(KVC)
    [self setValue:[[LCJTabBar alloc] init] forKeyPath:@"tabBar"];
}

#pragma mark - 封装导航控制器的创建
- (void)creatNav:(UIViewController *)viewVc image:(UIImage *)image selectImage:(UIImage *)selectImage title:(NSString *)title{
    
    //设置每个页面的导航控制器标题
    viewVc.tabBarItem.title = title;
    if(image){
        viewVc.tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        viewVc.tabBarItem.selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    //添加到根视图tabBar中
    [self addChildViewController:viewVc];
}

@end
