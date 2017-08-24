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
 * @fileName : LCJNavButtonItem.h
 * ==============================================================
*/

#import <Foundation/Foundation.h>

@interface LCJNavButtonItem : NSObject

+(UIBarButtonItem *)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

@end
