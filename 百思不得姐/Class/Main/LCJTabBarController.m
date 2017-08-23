//
//  LCJTabBarController.m
//  百思不得姐
//
//  Created by minya on 2017/8/23.
//  Copyright © 2017年 LiChaoJun. All rights reserved.
//

#import "LCJTabBarController.h"
#import "LCJNavigationController.h"
#import "LCJCreamViewController.h"
#import "LCJNewViewController.h"
#import "LCJAttentionViewController.h"
#import "LCJMineViewController.h"

@interface LCJTabBarController ()

@end

@implementation LCJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatAllNav];
}

//创建所有子控制器
-(void)creatAllNav
{
    //添加第一个导航子控制器[精华]
    LCJCreamViewController * cream = [[LCJCreamViewController alloc] init];
    [self creatNav:cream image:[UIImage imageNamed:@"tabBar_essence_icon"] selectImage:[UIImage imageNamed:@"tabBar_essence_click_icon"] title:@"精华"];
    
    //添加第二个导航子控制器[新帖]
    LCJNewViewController * new = [[LCJNewViewController alloc] init];
    [self creatNav:new image:[UIImage imageNamed:@"tabBar_new_icon"] selectImage:[UIImage imageNamed:@"tabBar_new_click_icon"] title:@"新帖"];
    
    //添加第三个导航子控制器[关注]
    LCJAttentionViewController * attention = [[LCJAttentionViewController alloc] init];
    [self creatNav:attention image:[UIImage imageNamed:@"tabBar_friendTrends_icon"] selectImage:[UIImage imageNamed:@"tabBar_friendTrends_click_icon"] title:@"关注"];
    
    //添加第四个导航子控制器[我]
    LCJMineViewController * mine = [[LCJMineViewController alloc] init];
    [self creatNav:mine image:[UIImage imageNamed:@"tabBar_me_icon"] selectImage:[UIImage imageNamed:@"tabBar_me_click_icon"] title:@"我"];
    
    [UITabBar appearance].barTintColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1];
}

//封装导航控制器的创建
- (void)creatNav:(UIViewController *)viewVc image:(UIImage *)image selectImage:(UIImage *)selectImage title:(NSString *)title{
    
    //设置每个页面的导航控制器标题
    viewVc.navigationItem.title = title;
    viewVc.view.backgroundColor = [UIColor whiteColor];
    
    //创建每个导航控制器
    LCJNavigationController * nav = [[LCJNavigationController alloc] initWithRootViewController:viewVc];
    
    /*
     * nav.navigationBar导航条的相关内容抽取类
     * 放在Main中的LiLiNavigationController中去设置
     * 首先导入#import "LiLiNavigationController.h"
     * 创建导航控制器时使用LiLiNavigationController创建
     */

    //tabbar的相关设置
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [nav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: LCJColor(140, 132, 129)} forState:UIControlStateNormal];
    [nav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: LCJColor(81, 81, 81)} forState:UIControlStateSelected];
    
    //添加到根视图tabBar中
    [self addChildViewController:nav];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
