/*
 * ==============================================================
 * When I wrote this, only God and I understood what I was doing
 * Now, God only knows
 * 写这段代码的时候，只有上帝和我知道它是干嘛的
 * 现在，只有上帝知道
 *
 * @author   : LiChaoJun
 * @datetime : 2017/8/23
 * @gayhib   : https://github.com/LCJ-MinYa
 * @project  : 百思不得姐
 * @fileName : LCJColor.h
 * ==============================================================
*/

#import <Foundation/Foundation.h>

@interface LCJColor : NSObject

//全局颜色相关
#define LCJColorAlpha(R, G, B, A) [UIColor colorWithRed:(R)/255.0 green:(G)/255.0 blue:(B)/255.0 alpha:(A)/255.0]
#define LCJColor(R, G, B) LCJColorAlpha((R), (G), (B), 255)
#define LCJRandomColor LCJColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

@end
