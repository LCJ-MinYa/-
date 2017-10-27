//
//  LCJAFHTTPClient.h
//  百思不得姐
//
//  Created by CA on 2017/9/4.
//  Copyright © 2017年 LiChaoJun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCJAFHTTPClient : NSObject

/*
 * POST请求封装
 * reqUrl:请求地址 string类型
 * params:请求参数 NSDictionary类型
 * returnData:请求成功返回数据
 */
+ (void)PostService:(UIViewController *)view reqUrl:(NSString *)reqUrl params:(NSDictionary *)params success:(void(^)(id data))success fail:(void(^)(void))fail loadingText:(NSString *)loadingText showLoading:(BOOL)showLoading bizError:(BOOL)bizError;

/*
 * GET请求封装
 * reqUrl:请求地址 string类型
 * params:请求参数 NSDictionary类型
 * returnData:请求成功返回数据
 */
+ (void)GetService:(UIViewController *)view reqUrl:(NSString *)reqUrl params:(NSDictionary *)params success:(void(^)(id data))success fail:(void(^)(void))fail loadingText:(NSString *)loadingText showLoading:(BOOL)showLoading bizError:(BOOL)bizError;

@end
