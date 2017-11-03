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
 * @fileName : LCJAPIConfig.h
 * ==============================================================
*/

#import <Foundation/Foundation.h>

@interface LCJAPIConfig : NSObject

#ifdef DEBUG
//debug状态下的测试api
#define API_BASE_URL @"http://api.budejie.com"

#else
//Release状态下的线上API
#define API_BASE_URL @"http://api.budejie.com"
#endif

//接口列表
#define MINE_LIST @"/api/api_open.php" //我的页面列表
#define CREAM_ALL @"/api/api_open.php" //精华全部数据

@end
