//
//  LCJAllViewController.m
//  百思不得姐
//
//  Created by CA on 2017/9/12.
//  Copyright © 2017年 LiChaoJun. All rights reserved.
//

#import "LCJAllViewController.h"
#import "LCJAFHTTPClient.h"

@interface LCJAllViewController ()

@end

@implementation LCJAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadAllData];
    
    self.tableView.contentInset = UIEdgeInsetsMake(40, 0, 0, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
}

#pragma mark - 请求全部数据
-(void)loadAllData
{
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    [params setValue:@"list" forKey:@"a"];
    [params setValue:@"data" forKey:@"c"];
    [LCJAFHTTPClient GetService:self reqUrl:CREAM_ALL params:params success:^(id data) {
        LCJLog(@"%@", data);
    } fail:^{
        LCJLog(@"请求失败");
    } loadingText:nil showLoading:true bizError:false];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.确定重用标示
    static NSString * ID = @"cell";
    
    //2.从缓存池中取
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    //3.如果为空就手动创建
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.backgroundColor = self.view.backgroundColor;
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%zd", indexPath.row];
    return cell;
}

@end
