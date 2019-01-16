//
//  SFHTTP.m
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/10/7.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import "SFHTTP.h"

@implementation SFHTTP
+ (AFHTTPSessionManager*)defaultHTTPHelper
{
    static AFHTTPSessionManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[AFHTTPSessionManager alloc]init];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/json",@"text/javascript",@"text/plain",@"image/bmp",@"image/jpeg",@"image/png", nil];
    });
    return manager;
}

static AFURLSessionManager *urlsession ;
+ (AFURLSessionManager *)defaultURLSession
{
    static dispatch_once_t onceToken2;
    dispatch_once(&onceToken2, ^{
        urlsession = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    });
    return urlsession;
}

+ (void)GET:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    // 创建请求管理者
    AFHTTPSessionManager *manage = [SFHTTP defaultHTTPHelper];
    [self setHTTPRequest:manage];
    if (![URLString isEqualToString:@"captcha"] && ![URLString isEqualToString:@"needCaptcha"]) {
        [manage.requestSerializer setValue:[NSString stringWithFormat:@"Bearer %@",UD_GET_OBJ(UUID)] forHTTPHeaderField:@"Authorization"];
    }
    //拼接URL
    
    NSString *URLStr = [NSString stringWithFormat:@"%@%@",UD_GET_OBJ(SERVER_URL),URLString];
    
    
    NSLog(@"请求URL = %@",URLStr);
    NSLog(@"%@---",parameters);
    
    [manage GET:URLStr parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString*jsonString = [[NSString alloc]initWithBytes:[responseObject bytes] length:[responseObject length] encoding:NSUTF8StringEncoding];
        NSLog(@"请求URL:%@\n参数:%@\n返回结果:%@",URLStr,parameters,jsonString);
        
        [self netWorkingHandle:responseObject success:success failure:failure];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSData *data = error.userInfo[@"com.alamofire.serialization.response.error.data"] ;
        NSString *errorStr = [[ NSString alloc ] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"errorStr%@",errorStr);
        [MBProgressHUD hideHUD];
        if(error.code != -999)
        {
            [MBProgressHUD showError:@"网络错误"];
            if(failure)
                failure(error);
        }
    }];
}

+ (void)POST:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    // 创建请求管理者
    AFHTTPSessionManager *manage = [SFHTTP defaultHTTPHelper];
    if (![URLString isEqualToString:@"auth/sso/login"] && ![URLString isEqualToString:@"auth/sso/publicKey"]) {
        [self setJsonRequest:manage];
    }
    else
    {
        [self setHTTPRequest:manage];
    }
    
    //拼接URL
    NSString *URLStr = [NSString stringWithFormat:@"%@%@",UD_GET_OBJ(SERVER_URL),URLString];
    
    NSLog(@"请求URL = %@",URLStr);
    NSLog(@"请求体 = %@",parameters);
    
    [manage POST:URLStr parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString*jsonString = [[NSString alloc]initWithBytes:[responseObject bytes] length:[responseObject length] encoding:NSUTF8StringEncoding];
        NSLog(@"请求URL:%@\n参数:%@\n返回结果:%@",URLStr,parameters,jsonString);
        
        [self netWorkingHandle:responseObject success:success failure:failure];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSData *data = error.userInfo[@"com.alamofire.serialization.response.error.data"] ;
        NSString *errorStr = [[ NSString alloc ] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"errorStr%@",errorStr);
        [MBProgressHUD hideHUD];
        if(error.code != -999)//-999为用户主动取消
        {
            //if(![URLString isEqualToString:@"auth/sso/publicKey"])
            [MBProgressHUD showError:@"网络错误"];
            if(failure)
                failure(error);
        }
    }];
}

+(void)setJsonRequest:(AFHTTPSessionManager*)manage
{
    AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    [requestSerializer setValue:[NSString stringWithFormat:@"Bearer %@",UD_GET_OBJ(UUID)] forHTTPHeaderField:@"Authorization"];
    // 设置超时时间
    [requestSerializer willChangeValueForKey:@"timeoutInterval"];
    requestSerializer.timeoutInterval = 60.f;
    [requestSerializer didChangeValueForKey:@"timeoutInterval"];
    manage.requestSerializer = requestSerializer;
}

/**
 上传图片
 */
+(void)uploadImageArrays:(NSArray*)imageArrays Progress:(void (^)(id Progress))Progress success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    NSString *urlstr = [NSString stringWithFormat:@"%@%@",UD_GET_OBJ(FILE_SERVER_URL),@"/upc/upload"];
    AFHTTPSessionManager *manage = [SFHTTP defaultHTTPHelper];
    [manage POST:urlstr parameters:@{@"type":@(1)} constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (int i = 0; i < imageArrays.count; i++) {
            
            UIImage *image = imageArrays[i];
            NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
            // 可以在上传时使用当前的系统事件作为文件名
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            // 设置时间格式
            [formatter setDateFormat:@"yyyyMMddHHmmss.SSS"];
            NSString *dateString = [formatter stringFromDate:[NSDate date]];
            NSString *fileName = [NSString  stringWithFormat:@"%@.jpg", dateString];
            NSLog(@"dateString--%@",dateString);
            [formData appendPartWithFileData:imageData name:@"file" fileName:fileName mimeType:@"image/jpeg"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"进度%f",uploadProgress.fractionCompleted);
        if(Progress)
        {
            Progress(@(uploadProgress.fractionCompleted));
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString*jsonString = [[NSString alloc]initWithBytes:[responseObject bytes] length:[responseObject length] encoding:NSUTF8StringEncoding];
        NSLog(@"图片上传:%@",jsonString);
        NSDictionary *dictionary= [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if(success)
        {
            success(dictionary);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(failure)
        {
            failure(error);
        }
    }];
}

+(void)setHTTPRequest:(AFHTTPSessionManager*)manage
{
    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
    manage.requestSerializer = requestSerializer;
    // 设置超时时间
    [manage.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manage.requestSerializer.timeoutInterval = 10.0f;
    [manage.requestSerializer didChangeValueForKey:@"timeoutInterval"];
}
+(void)netWorkingHandle:(id)responseObject success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
    int code = MSGCODE(dictionary);
    //    0("成功") 代表成功
    //    401("没有权限") 代表没有权限
    //    700100("请求错误") 最常见的错误，如参数校验不通过，不允许的操作等
    //    710001("token失效"), 代表登录已经过期，应该转到登录界面
    //    700101("系统错误")    代表后台应用已经产生异常，诸如网络问题、代码错误等
    if(code==0)
    {
        [MBProgressHUD hideHUD];
        if(success)
            success(dictionary);
    }
    else if(code == 710001)//登录过期
    {
        [MBProgressHUD hideHUD];
        [MBProgressHUD showOnlyText:@"登录已过期,请重新登录!" viewBottomDis:200];
//        [[LoginManger shareManger] loginOutIsAuto:0];
    }
    else
    {
        [MBProgressHUD hideHUD];
        id data = dictionary[@"data"];
        if([data isKindOfClass:[NSString class]])
        {
            [MBProgressHUD showOnlyText:data afterDelay:1.2];
        }
        if(failure)
        {
            NSError *error = [NSError errorWithDomain:NSPOSIXErrorDomain code:code userInfo:@{@"info":data}];
            failure(error);
        }
    }
}
@end
