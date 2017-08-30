//
//  LCJMineViewController.m
//  百思不得姐
//
//  Created by minya on 2017/8/23.
//  Copyright © 2017年 LiChaoJun. All rights reserved.
//

#import "LCJMineViewController.h"
#import "LCJNavButtonItem.h"
#import "LCJSettingViewController.h"

@interface LCJMineViewController ()

@end

@implementation LCJMineViewController

#pragma mark 初始化重写init方法
-(instancetype)init
{
    return [self initWithStyle:UITableViewStyleGrouped];
}

#pragma mark 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航器相关
    [self setNav];
    
    //设置tableview的相关参数
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 10;
    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
    
}

#pragma mark 设置导航器相关[UI]
-(void)setNav
{
    //设置背景颜色
    self.view.backgroundColor = LCJCommonBgColor;
    
    //标题
    self.navigationItem.title = @"我的关注";
    //右边设置按钮
    UIBarButtonItem * settingItem = [LCJNavButtonItem itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingButtonClick)];
    
    //右边moon按钮
    UIBarButtonItem * moonItem = [LCJNavButtonItem itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(moonButtonClick)];
    
    self.navigationItem.rightBarButtonItems = @[settingItem, moonItem];
}

#pragma mark 右侧设置按钮点击事件
-(void)settingButtonClick
{
    LCJLog(@"点击设置按钮");
    LCJSettingViewController * setting = [[LCJSettingViewController alloc] init];
    [self.navigationController pushViewController:setting animated:YES];
}

#pragma mark 右侧moon按钮点击事件
-(void)moonButtonClick
{
    LCJLog(@"点击moon按钮");
}

#pragma mark tableView数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.确定重用标示
    static NSString * ID = @"cell";
    
    //2.从缓存池中取
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    //3.如果空就手动创建
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%zd", indexPath.section];
    
    return cell;
}

#pragma mark 设置cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 2) return 300;
    return 44;
}

@end
