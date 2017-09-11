//
//  LCJMineFooterView.m
//  百思不得姐
//
//  Created by CA on 2017/9/7.
//  Copyright © 2017年 LiChaoJun. All rights reserved.
//

#import "LCJMineFooterView.h"
#import "LCJAFHTTPClient.h"
#import "LCJMineFooterModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <MJExtension.h>
#import "LCJMineFooterListBtn.h"

@implementation LCJMineFooterView

-(instancetype)initWithFrame:(CGRect)frame viewVc:(UIViewController *)viewVc
{
    if(self = [super initWithFrame:frame]){
        NSMutableDictionary * params = [NSMutableDictionary dictionary];
        [params setValue:@"square" forKey:@"a"];
        [params setValue:@"topic" forKey:@"c"];
        [LCJAFHTTPClient GetService:viewVc reqUrl:MINE_LIST params:params success:^(id data) {
            NSArray * footerContent = [LCJMineFooterModel mj_objectArrayWithKeyValuesArray:data[@"square_list"]];
            //创建对应的视图
            [self creatFooterContent: footerContent];
        } fail:^{
            LCJLog(@"请求失败");
        } loadingText:nil showLoading:false bizError:false];
    }
    return self;
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
        LCJMineFooterModel * item = data[i];
        LCJMineFooterListBtn * button = [LCJMineFooterListBtn buttonWithType:UIButtonTypeCustom];
        [self addSubview:button];
        
        button.backgroundColor = [UIColor whiteColor];
        if(i % maxColsCount == 3){
            button.lcj_width = buttonW;
        }else{
            button.lcj_width = buttonW - 1;
        }
        button.lcj_height = buttonH - 1;
        button.lcj_x = (i % maxColsCount) * buttonW;
        button.lcj_y = (i / maxColsCount) * buttonH;
        [button setTitle:item.name forState:UIControlStateNormal];
        [button.imageView sd_setImageWithURL:[NSURL URLWithString:item.icon] placeholderImage:[UIImage imageNamed:@"setup-head-default"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            [button setImage:image forState:UIControlStateNormal];
        }];
        [button addTarget:self action:@selector(footerContentButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    //设置footer的高度为最后一个按钮的bottom(最大Y值)
    self.lcj_height = self.subviews.lastObject.lcj_bottomY;
    
    UITableView * tableView = (UITableView *)self.superview;
    tableView.contentSize = CGSizeMake(0, self.lcj_bottomY);
}

#pragma mark footer内按钮点击事件
-(void)footerContentButtonClick:(LCJMineFooterListBtn *)button
{
    LCJLog(@"click");
}

@end
