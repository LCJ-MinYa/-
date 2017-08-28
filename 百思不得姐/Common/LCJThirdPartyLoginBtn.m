//
//  LCJThirdPartyLoginBtn.m
//  百思不得姐
//
//  Created by minya on 2017/8/28.
//  Copyright © 2017年 LiChaoJun. All rights reserved.
//

#import "LCJThirdPartyLoginBtn.h"

@implementation LCJThirdPartyLoginBtn

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.lcj_y = 0;
    self.imageView.lcj_centerX = self.lcj_width * 0.5;
    
    self.titleLabel.lcj_x = 0;
    self.titleLabel.lcj_y = self.imageView.lcj_height;
    self.titleLabel.lcj_height = self.lcj_height - self.titleLabel.lcj_y;
    self.titleLabel.lcj_width = self.lcj_width;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

@end
