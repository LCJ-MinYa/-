//
//  LCJAFHTTPClient.m
//  百思不得姐
//
//  Created by CA on 2017/9/4.
//  Copyright © 2017年 LiChaoJun. All rights reserved.
//

#import "LCJAFHTTPClient.h"
#import <AFNetworking.h>
#import <MBProgressHUD.h>

@implementation LCJAFHTTPClient

//Get请求
+ (void)GetService:(UIViewController *)view reqUrl:(NSString *)reqUrl params:(NSDictionary *)params success:(void(^)(id data))success fail:(void(^)(void))fail loadingText:(NSString *)loadingText showLoading:(BOOL)showLoading bizError:(BOOL)bizError
{
    [self sendReq:view reqUrl:reqUrl params:params success:^(id data) {
        success(data);
    } fail:^{
        fail();
    } loadingText:loadingText showLoading:showLoading bizError:bizError getOrpost:@"GET"];
}

//Post请求
+ (void)PostService:(UIViewController *)view reqUrl:(NSString *)reqUrl params:(NSDictionary *)params success:(void(^)(id data))success fail:(void(^)(void))fail loadingText:(NSString *)loadingText showLoading:(BOOL)showLoading bizError:(BOOL)bizError
{
    [self sendReq:view reqUrl:reqUrl params:params success:^(id data) {
        success(data);
    } fail:^{
        fail();
    } loadingText:loadingText showLoading:showLoading bizError:bizError getOrpost:@"POST"];
}

//发送请求
+(void)sendReq:(UIViewController *)view reqUrl:(NSString *)reqUrl params:(NSDictionary *)params success:(void(^)(id data))success fail:(void(^)(void))fail loadingText:(NSString *)loadingText showLoading:(BOOL)showLoading bizError:(BOOL)bizError getOrpost:(NSString *)getOrpost
{
    MBProgressHUD * loading;
    //显示加载框
    if(showLoading){
        loading = [self showReqLoading:view loadingText:loadingText onlyShowText:NO];
    }
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //设置请求超时时间
    manager.requestSerializer.timeoutInterval = 5.0;
    //转换请求链接为UTF8
    NSString * joinUrl = [API_BASE_URL stringByAppendingString:reqUrl];
    NSString * url = [joinUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    //封装基本参数
    NSMutableDictionary * newParams = [NSMutableDictionary dictionary];
    if(params != nil){
        [newParams addEntriesFromDictionary:params];
    }
    if([getOrpost isEqualToString:@"GET"]){
        [manager GET:url parameters:newParams progress:^(NSProgress * _Nonnull uploadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //关闭加载框
            if(showLoading){
                [self hideReqLoading:loading afterDelay:0];
            }
            NSDictionary * response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            success(response);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            LCJLog(@"%@", error);
            if(fail){
                fail();
            }
        }];
    }else{
        [manager POST:url parameters:newParams progress:^(NSProgress * _Nonnull uploadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //关闭加载框
            if(showLoading){
                [self hideReqLoading:loading afterDelay:0];
            }
            NSMutableDictionary * response = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            success(response);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            LCJLog(@"%@", error);
            if(fail){
                fail();
            }
        }];
    }
}

//封装显示网络请求等待
+ (MBProgressHUD *)showReqLoading:(UIViewController *)view loadingText:(NSString *)loadingText onlyShowText:(BOOL)onlyShowText
{
    MBProgressHUD * loading = [MBProgressHUD showHUDAddedTo:view.view animated:YES];
    if(onlyShowText){
        loading.mode = MBProgressHUDModeText;
    }else{
        loading.mode = MBProgressHUDModeIndeterminate;
    }
    if([loadingText isEqualToString:@""] || [loadingText length]==0){
        loading.detailsLabel.text = @"正在加载...";
    }else{
        loading.detailsLabel.text = loadingText;
    }
    loading.contentColor = [UIColor whiteColor];
    loading.bezelView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    return loading;
}

//封装关闭网络请求等待
+ (void)hideReqLoading:(MBProgressHUD *)loadingClass afterDelay:(NSInteger)afterDelay
{
    [loadingClass hideAnimated:YES afterDelay:afterDelay];
}

@end
