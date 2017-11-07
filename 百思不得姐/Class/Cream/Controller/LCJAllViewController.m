//
//  LCJAllViewController.m
//  百思不得姐
//
//  Created by CA on 2017/9/12.
//  Copyright © 2017年 LiChaoJun. All rights reserved.
//

#import "LCJAllViewController.h"
#import "LCJAFHTTPClient.h"
#import "LCJCreamModel.h"
#import <MJExtension.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "LCJRefreshHeader.h"
#import "LCJRefreshFooter.h"

@interface LCJAllViewController ()

//所有的帖子数据
@property (nonatomic, strong) NSMutableArray<LCJCreamModel *> * topics;
//maxtime,加载下一页
@property (nonatomic, copy) NSString * maxtime;

@end

@implementation LCJAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(40, 0, 0, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    //tableview初始化的时候不显示横线
    self.tableView.tableFooterView = [[UIView alloc]init];
    
    [self setupRefresh];
}

#pragma mark - 下拉刷新上拉加载
-(void)setupRefresh
{
    self.tableView.mj_header = [LCJRefreshHeader headerWithRefreshingBlock:^{
        [self loadAllData:false pullRefreshOrPullUpLoad:@"refresh"];
    }];
    
    self.tableView.mj_footer = [LCJRefreshFooter footerWithRefreshingBlock:^{
        [self loadAllData:false pullRefreshOrPullUpLoad:@"loading"];
    }];
    
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark - 请求全部数据
-(void)loadAllData:(BOOL)showLoading pullRefreshOrPullUpLoad:(NSString *)pullRefreshOrPullUpLoad
{
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    [params setValue:@"list" forKey:@"a"];
    [params setValue:@"data" forKey:@"c"];
    if([pullRefreshOrPullUpLoad isEqualToString:@"loading"]){
        [params setValue:self.maxtime forKey:@"maxtime"];
    }

    [LCJAFHTTPClient GetService:self reqUrl:CREAM_ALL params:params success:^(id data) {
        self.maxtime = data[@"info"][@"maxtime"];
        
        if([pullRefreshOrPullUpLoad isEqualToString:@"loading"]){
            NSArray * moreTopics = [LCJCreamModel mj_objectArrayWithKeyValuesArray:data[@"list"]];
            [self.topics addObjectsFromArray:moreTopics];
        }else{
            self.topics = [LCJCreamModel mj_objectArrayWithKeyValuesArray:data[@"list"]];
        }
        
        //刷新表格
        [self.tableView reloadData];
        
        //结束下拉刷新
        if([pullRefreshOrPullUpLoad isEqualToString:@"loading"]){
            [self.tableView.mj_footer endRefreshing];
        }else if([pullRefreshOrPullUpLoad isEqualToString:@"refresh"]){
            [self.tableView.mj_header endRefreshing];
        }
    } fail:^{
        LCJLog(@"请求失败");
        //结束下拉刷新
        if([pullRefreshOrPullUpLoad isEqualToString:@"loading"]){
            [self.tableView.mj_footer endRefreshing];
        }else if([pullRefreshOrPullUpLoad isEqualToString:@"refresh"]){
            [self.tableView.mj_header endRefreshing];
        }
    } loadingText:nil showLoading:showLoading bizError:false];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.topics.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.确定重用标示
    static NSString * ID = @"cell";
    
    //2.从缓存池中取
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    //3.如果为空就手动创建
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.backgroundColor = self.view.backgroundColor;
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%zd", indexPath.row];
    
    //4.显示数据
    LCJCreamModel * topic = self.topics[indexPath.row];
    cell.textLabel.text = topic.name;
    cell.detailTextLabel.text = topic.text;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:topic.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    return cell;
}

@end
