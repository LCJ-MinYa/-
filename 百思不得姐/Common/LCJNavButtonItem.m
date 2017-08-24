/*
 * ==============================================================
 * When I wrote this, only God and I understood what I was doing
 * Now, God only knows
 * 写这段代码的时候，只有上帝和我知道它是干嘛的
 * 现在，只有上帝知道
 *
 * @author   : LiChaoJun
 * @datetime : 2017/8/24
 * @gayhib   : https://github.com/LCJ-MinYa
 * @project  : 百思不得姐
 * @fileName : LCJNavButtonItem.m
 * ==============================================================
*/

#import "LCJNavButtonItem.h"

@implementation LCJNavButtonItem

+(UIBarButtonItem *)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
