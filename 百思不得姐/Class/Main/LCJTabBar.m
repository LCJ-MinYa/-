//
//  LCJTabBar.m
//  百思不得姐
//
//  Created by minya on 2017/8/24.
//  Copyright © 2017年 LiChaoJun. All rights reserved.
//

#import "LCJTabBar.h"

@interface LCJTabBar ()

//中间的发布按钮
@property (nonatomic, weak) UIButton * publishButton;

@end

@implementation LCJTabBar

#pragma mark - 懒加载发布按钮
-(UIButton *)publishButton
{
    if(!_publishButton){
        UIButton * publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        publishButton.lcj_width = self.frame.size.width / 5;
        publishButton.lcj_height = self.frame.size.height;
        publishButton.lcj_centerX = self.frame.size.width * 0.5;
        publishButton.lcj_centerY = self.frame.size.height * 0.5;
        [publishButton addTarget:self action:@selector(publishButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:publishButton];
        _publishButton = publishButton;
    }
    return _publishButton;
}

#pragma mark - 发布按钮点击事件
-(void)publishButtonClick
{
    LCJLog(@"点击发布按钮");
}

#pragma mark 布局子控件
-(void)layoutSubviews
{
    //父类代码先执行布局
    [super layoutSubviews];
    
    //再覆盖父类布局(设置所有UITabBarButton的frame)
    CGFloat buttonW = self.frame.size.width / 5;
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonY = 0;
    int buttonIndex = 0;
    for (UIView * subview in self.subviews) {
        if(subview.class != NSClassFromString(@"UITabBarButton")) continue;
        CGFloat buttonX = buttonIndex * buttonW;
        if(buttonIndex>=2){
            buttonX += buttonW;
        }
        subview.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        buttonIndex++;
    }
    
    //设置中间发布按钮
    [self publishButton];
}

@end
