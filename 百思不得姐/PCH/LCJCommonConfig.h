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
 * @fileName : LCJCommonConfig.h
 * ==============================================================
*/

#import <Foundation/Foundation.h>

@interface LCJCommonConfig : NSObject

//打印日志
#ifdef DEBUG
#define LCJLog(...) NSLog(__VA_ARGS__)
#else
#define LCJLog(...)
#endif

//全局页面一次请求条数
#define THE_PAGE_SIZE @"10"

@end
