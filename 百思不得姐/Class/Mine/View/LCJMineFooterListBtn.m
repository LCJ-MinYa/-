//
//  LCJMineFooterListBtn.m
//  百思不得姐
//
//  Created by CA on 2017/9/11.
//  Copyright © 2017年 LiChaoJun. All rights reserved.
//

#import "LCJMineFooterListBtn.h"

@implementation LCJMineFooterListBtn

//文字居中只需要设置更改初始化属性
-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        [self setTitleColor:LCJColor(70, 70, 70) forState:UIControlStateNormal];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    //设置图片的位置和大小
    self.imageView.lcj_y = self.lcj_height * 0.15;
    self.imageView.lcj_height = self.lcj_height * 0.5;
    self.imageView.lcj_width = self.imageView.lcj_height;
    self.imageView.lcj_centerX = self.lcj_width * 0.5;
    
    //设置文字的位置
    self.titleLabel.lcj_x = 0;
    self.titleLabel.lcj_y = self.imageView.lcj_bottomY;
    self.titleLabel.lcj_width = self.lcj_width;
    self.titleLabel.lcj_height = self.lcj_height - self.titleLabel.lcj_y;
    
}

@end
