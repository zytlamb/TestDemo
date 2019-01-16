//
//  SFHTTP.h
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/10/7.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MSGCODE(x) [x[@"msgcode"] intValue]
#define PAGETURN(x) (x[@"data"][@"pageTurn"])

@interface SFHTTP : NSObject
+ (AFHTTPSessionManager *)defaultHTTPHelper;
+ (AFURLSessionManager *)defaultURLSession;
/**
 *  发送get请求
 *
 *  @param URLString  请求的基本的url
 *  @param parameters 请求的参数字典
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)GET:(NSString *)URLString
 parameters:(id)parameters
    success:(void (^)(id responseObject))success
    failure:(void (^)(NSError *error))failure;

/**
 *  发送post请求
 *
 *  @param URLString  请求的基本的url
 *  @param parameters 请求的参数字典
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)POST:(NSString *)URLString
  parameters:(id)parameters
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure;

@end
