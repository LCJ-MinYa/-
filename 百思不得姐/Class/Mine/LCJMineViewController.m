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
#import "LCJAFHTTPClient.h"
#import <MJExtension.h>
#import "LCJMineFooterContent.h"
#import <SDWebImage/UIImageView+WebCache.h>

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
    
    //tableview相关设置
    [self setFooterView];
    
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

#pragma mark tableview相关设置[UI]
-(void)setFooterView
{
    //设置tableview的相关参数
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 10;
    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
    
    //设置tableView的footerView
    UIView * footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1200)];
    footerView.backgroundColor = LCJRandomColor;
    self.tableView.tableFooterView = footerView;
    
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    [params setValue:@"square" forKey:@"a"];
    [params setValue:@"topic" forKey:@"c"];
    [LCJAFHTTPClient GetService:self reqUrl:MINE_LIST params:params success:^(id data) {
        NSArray * footerContent = [LCJMineFooterContent mj_objectArrayWithKeyValuesArray:data[@"square_list"]];
        //创建对应的视图
        [self creatFooterContent: footerContent];
    } fail:^{
        LCJLog(@"请求失败");
    } loadingText:nil showLoading:false bizError:false];
}

#pragma mark 根据数据创建footerContent视图[UI]
-(void)creatFooterContent:(NSArray *)data
{
    //方块个数
    NSUInteger count = data.count;

    //方块尺寸
    int maxColsCount = 4; //一行最多4列
    CGFloat buttonW = SCREEN_WIDTH / 4;
    CGFloat buttonH = buttonW;
    
    for (NSUInteger i=0; i<count; i++) {
        LCJMineFooterContent * item = data[i];
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.tableView.tableFooterView addSubview:button];
        
        button.backgroundColor = LCJRandomColor;
        button.lcj_width = buttonW;
        button.lcj_height = buttonH;
        button.lcj_x = (i % maxColsCount) * buttonW;
        button.lcj_y = (i / maxColsCount) * buttonH;
        [button setTitle:item.name forState:UIControlStateNormal];
        [button.imageView sd_setImageWithURL:[NSURL URLWithString:item.icon] placeholderImage:[UIImage imageNamed:@"setup-head-default"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            [button setImage:image forState:UIControlStateNormal];
        }];
    }
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
    return 2;
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
    
    if(indexPath.section == 0){
        cell.textLabel.text = @"登陆／注册";
        cell.imageView.image = [UIImage imageNamed:@"setup-head-default"];
    }else{
        cell.textLabel.text = @"离线下载";
        //避免循环利用的问题
        cell.imageView.image = nil;
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark 设置cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

@end
