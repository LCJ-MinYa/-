//
//  LCJNavigationController.m
//  百思不得姐
//
//  Created by minya on 2017/8/24.
//  Copyright © 2017年 LiChaoJun. All rights reserved.
//

#import "LCJNavigationController.h"

@interface LCJNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation LCJNavigationController

#pragma mark 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     * 重定义左侧按钮会影响右滑返回
     * 需要自己再添加上
     */
    self.interactivePopGestureRecognizer.delegate = self;
    
    //设置导航控制器的背景图片
//    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

#pragma mark 重写push方法，里面设置返回键
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(self.childViewControllers.count >= 1){
        //隐藏tabBar
        viewController.hidesBottomBarWhenPushed = YES;
        
        //左上角
        UIButton * backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [backButton sizeToFit];
        //设置向左偏移
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    }
    
    /*
     *  统一不能设置背景色
     *  凡是调用子控制器的view都会触发viewDidLoad方法，导致渲染，不能懒加载每个视图（即点击那个视图才显示哪个视图）
     *  viewController.view.backgroundColor = LCJCommonBgColor;
     *  解决办法:
     *  创建一个继承于UIViewController的类，然后其他视图所有继承这个类，在此类中定义统一背景
     *  特殊页面也可以自行重写背景颜色
     */
    
    //下一个页面设置完毕后再push进去
    [super pushViewController:viewController animated:animated];
}

#pragma mark 重写pop方法
-(UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    return [super popViewControllerAnimated:YES];
}

#pragma mark #返回键的点击事件
-(void)back
{
    [self popViewControllerAnimated:YES];
}

#pragma mark 添加手势返回代理
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    /*
     *  返回值决定手势是否有效
     *  当导航控制器的子控制器只有一个视图时，即返回到当前控制器的主页，需要返回NO，即不允许手势实效
     *  当导航控制器的子控制器超过一个视图时，即非主页都允许返回，返回YES
     *  if(self.childViewControllers.count == 1){
     *      return NO;
     *  }
     *  return YES;
     */
    return self.childViewControllers.count > 1;
}


@end
