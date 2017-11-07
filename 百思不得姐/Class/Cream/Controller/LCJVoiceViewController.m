//
//  LCJVoiceViewController.m
//  百思不得姐
//
//  Created by CA on 2017/9/12.
//  Copyright © 2017年 LiChaoJun. All rights reserved.
//

#import "LCJVoiceViewController.h"

@interface LCJVoiceViewController ()

@end

@implementation LCJVoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(40, 0, 0, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    //tableview初始化的时候不显示横线
    self.tableView.tableFooterView = [[UIView alloc]init];
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
