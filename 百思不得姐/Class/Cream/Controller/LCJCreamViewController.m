//
//  LCJCreamViewController.m
//  百思不得姐
//
//  Created by minya on 2017/8/23.
//  Copyright © 2017年 LiChaoJun. All rights reserved.
//

#import "LCJCreamViewController.h"
#import "LCJNavButtonItem.h"
#import "LCJAllViewController.h"
#import "LCJVideoViewController.h"
#import "LCJVoiceViewController.h"
#import "LCJImgViewController.h"
#import "LCJTextViewController.h"

@interface LCJCreamViewController () <UIScrollViewDelegate>

//当前选中的按钮
@property (nonatomic, weak) UIButton * selectedTitleButton;

//标题按钮指示器
@property (nonatomic, weak) UIView * indicatorView;

//UIScrollView
@property (nonatomic, weak) UIScrollView * scrollView;

//标题栏
@property (nonatomic, weak) UIView * titlesView;

@end

@implementation LCJCreamViewController

#pragma mark 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航器相关
    [self setNav];
    
    //添加分类
    [self setChildViewControllers];
    
    //设置scrollView
    [self setScrollView];
    
    //设置titleView
    [self setTitleView];
    
    //默认添加子控制器的view
    [self addChildVcView];
}

#pragma mark 设置导航器相关[UI]
-(void)setNav
{
    //设置背景颜色
    self.view.backgroundColor = LCJCommonBgColor;
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    //左边按钮
    UIBarButtonItem * leftButton = [LCJNavButtonItem itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(leftButtonClick)];
    self.navigationItem.leftBarButtonItems = @[leftButton];
}

#pragma mark 设置分类视图[UI]
-(void)setChildViewControllers
{
    LCJAllViewController * all = [[LCJAllViewController alloc] init];
    [self addChildViewController:all];
    LCJVideoViewController * video = [[LCJVideoViewController alloc] init];
    [self addChildViewController:video];
    LCJVoiceViewController * voice = [[LCJVoiceViewController alloc] init];
    [self addChildViewController:voice];
    LCJImgViewController * img = [[LCJImgViewController alloc] init];
    [self addChildViewController:img];
    LCJTextViewController * text = [[LCJTextViewController alloc] init];
    [self addChildViewController:text];
}

#pragma mark 设置ScrollView[UI]
-(void)setScrollView
{
    //不允许自动调整scrollView的内边距
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView * scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = LCJCommonBgColor;
    scrollView.frame = self.view.bounds;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = false;
    scrollView.delegate = self;
    
    //添加所以子控制器的view到scrollView中
    NSUInteger count = self.childViewControllers.count;
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * count, 0);
    
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
}

#pragma mark 设置titleView[UI]
-(void)setTitleView
{
    UIView * titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 40)];
    titleView.backgroundColor = LCJColorAlpha(255, 255, 255, 0.7);
    [self.view addSubview:titleView];
    self.titlesView = titleView;
    
    //添加标题
    NSArray * titles = @[@"全部", @"视频", @"声音", @"图片", @"段子"];
    NSUInteger count = titles.count;
    CGFloat titleButtonW = titleView.lcj_width / count;
    CGFloat titleButtonH = titleView.lcj_height;
    for (NSUInteger i=0; i<count; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.frame = CGRectMake(i * titleButtonW, 0, titleButtonW, titleButtonH);
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        //设置按钮颜色
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        
        [button addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [titleView addSubview:button];
    }
    
    //按钮选中颜色
    UIButton * firstButton = titleView.subviews.firstObject;
    
    //底部指示器
    UIView * indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor = [firstButton titleColorForState:UIControlStateDisabled];
    indicatorView.lcj_height = 1;
    indicatorView.lcj_y = titleView.lcj_height - 1;
    [titleView addSubview:indicatorView];
    self.indicatorView = indicatorView;
    
    //默认选中第一个
    [firstButton.titleLabel sizeToFit]; //让第一个选中的文字提前计算好
    [self titleBtnClick:firstButton];
}

#pragma mark 标题按钮点击事件
-(void)titleBtnClick:(UIButton *)button
{
    LCJLog(@"点击标题按钮");
    self.selectedTitleButton.enabled = YES;
    button.enabled = NO;
    self.selectedTitleButton = button;
    
    //移动指示器
    [UIView animateWithDuration:0.25 animations:^{
        CGFloat titleW = [button.currentTitle sizeWithAttributes:@{NSFontAttributeName:button.titleLabel.font}].width;
        self.indicatorView.lcj_width = titleW;
        self.indicatorView.lcj_centerX = button.lcj_centerX;
    }];
    
    //让UIScrollView滚动到对应位置
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = button.tag * self.scrollView.lcj_width;
    [self.scrollView setContentOffset:offset animated:YES];
}

#pragma mark 左侧按钮点击事件
-(void)leftButtonClick
{
    LCJLog(@"点击左侧按钮");
}

#pragma mark - 添加子控制器的View
-(void)addChildVcView
{
    //子控制器索引
    NSUInteger index = self.scrollView.contentOffset.x / self.scrollView.lcj_width;
    
    //取出子控制器
    UITableView * childVc = (UITableView *)self.childViewControllers[index].view;
    childVc.frame = CGRectMake(index * self.scrollView.lcj_width, 0, self.scrollView.lcj_width, self.scrollView.lcj_height);
    [self.scrollView addSubview:childVc];
    //childVc.contentInset = UIEdgeInsetsMake(40, 0, 0, 0);
}

#pragma mark - <UIScrollViewDelegate>
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self addChildVcView];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //子控制器索引
    NSUInteger index = scrollView.contentOffset.x / scrollView.lcj_width;
    UIButton * titleButton = self.titlesView.subviews[index];
    [self titleBtnClick:titleButton];
    
    [self addChildVcView];
}

@end
