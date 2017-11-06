//
//  LCJRefreshHeader.m
//  百思不得姐
//
//  Created by CA on 2017/11/6.
//  Copyright © 2017年 LiChaoJun. All rights reserved.
//

#import "LCJRefreshHeader.h"

@implementation LCJRefreshHeader

-(void)prepare
{
    [super prepare];
    
    self.automaticallyChangeAlpha = YES;
    self.lastUpdatedTimeLabel.textColor = [UIColor orangeColor];
    self.stateLabel.textColor = [UIColor orangeColor];
    [self setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [self setTitle:@"松开加载" forState:MJRefreshStatePulling];
    [self setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    
}

@end
