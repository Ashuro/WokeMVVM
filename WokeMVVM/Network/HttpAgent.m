//
//  HttpAgent.m
//  WokeMVVM
//
//  Created by 金秋成 on 16/3/26.
//  Copyright © 2016年 蓝兔子. All rights reserved.
//

#import "HttpAgent.h"
#import "AFNetworking.h"
#import "NSData+CommonCrypto.h"
#import "NSString+stringTransfer.h"
#import "NSData+Encryption.h"
#import "JSONModel.h"
//#import "Login.h"
static HttpAgent * _sharedAgent;


@interface HttpAgent ()
@property (nonatomic,strong) AFURLSessionManager * afManager;
@end


@implementation HttpAgent

+(instancetype)instance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedAgent = [[HttpAgent alloc]init];
        [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
        }];
        [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    });
    return _sharedAgent;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.afManager = [[AFURLSessionManager alloc]initWithSessionConfiguration:configuration];
        
    }
    return self;
}
-(NSURLSessionDataTask *)request:(id<HttpRequestProtocol>)protocol complete:(RequestBlock)complete{
    __weak NSURLSessionDataTask *dataTask = [self.afManager dataTaskWithRequest:[self getRequest:protocol] completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            complete(nil,error);
        } else {
            NSLog(@"%@ %@", response, responseObject);
            id<HttpResponseProtocol> resp = [[[protocol responseClass] alloc]initWithDictionary:responseObject error:nil];
            if ([resp status]==200) {
                complete(resp,nil);
            }
            else{
                NSError * error = [NSError errorWithDomain:@"woke api error" code:[resp status] userInfo:nil];
                complete(nil,error);
            }
        }
    }];
    [dataTask resume];
    return dataTask;
}



-(NSURLRequest * )getRequest:(id<HttpRequestProtocol>)protocol{
    NSInteger timestamp = (NSInteger)[[NSDate date] timeIntervalSince1970]*1000;
    NSDictionary * wokeHeaderDict = @{@"protocol-id":protocol.protocolId,
                                      @"shadow":@"MD5",
                                      @"c-time":[NSString stringWithFormat:@"%ld",timestamp],
                                      @"client-version":@"1.75"};
    
    NSMutableString * wokeHeaderStr = [NSMutableString new];
    [wokeHeaderDict enumerateKeysAndObjectsUsingBlock:^(NSString   * key, NSString *  obj, BOOL * _Nonnull stop) {
        [wokeHeaderStr appendFormat:@"%@:%@;",key,obj];
    }];
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://121.40.161.115:8080/woke/mobile.do"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"GUEST" forHTTPHeaderField:@"jsessionid"];
    [request setValue:wokeHeaderStr forHTTPHeaderField:@"woke"];
    [request setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];

    
    
    
    
    NSData *bodySTR = [protocol.toJSONString dataUsingEncoding:NSUTF8StringEncoding];
    NSData *bodyData = [bodySTR AES256EncryptWithKey:[[self getAESKey] substringToIndex:16]];
    [request setHTTPBody:bodyData];
    return request;
}


- (NSString *)getAESKey{
    
    NSString * SERVERKEY = @"abc";
    NSData * jsessionIDData;
    //jsessionID转data
//    if ([WokePersonalInfo instance].jsessionId) {
//        jsessionIDData = [[WokePersonalInfo instance].jsessionId dataUsingEncoding:NSUTF8StringEncoding];
//    }
//    else{
        jsessionIDData = [@"GUEST" dataUsingEncoding:NSUTF8StringEncoding];
//    }
    
    
    //jsessionID加密
    NSData * jsessionIDDataMD5 = [jsessionIDData MD5Sum];
    //jsessionID加密后，转为string
    NSString * jsessionIDDataMD5Str = [self getTrimString:jsessionIDDataMD5];
    //jsesstionID加密过后的字符串 加上serverkey
    NSString * appendPassWordWithJsessionIDDataMD5Str = [NSString stringWithFormat:@"%@%@",jsessionIDDataMD5Str,SERVERKEY];
    //jsesstionID加密过后的字符串加上serverkey 的字符串转data类型
    NSData *  appendPassWordWithJsessionIDDataMD5StrData = [appendPassWordWithJsessionIDDataMD5Str dataUsingEncoding:NSUTF8StringEncoding];
    //最终的加密字符串
    NSString * appendPassWordWithJsessionIDDataMD5StrDataMD5Str = [self getTrimString:[appendPassWordWithJsessionIDDataMD5StrData MD5Sum]];
    return appendPassWordWithJsessionIDDataMD5StrDataMD5Str;
}
- (NSString *)getTrimString:(NSData *)data{
    NSMutableCharacterSet * characterSet = [[NSMutableCharacterSet alloc]init];
    [characterSet addCharactersInString:@"<>"];
    NSString * passWordStr = [[[NSString stringWithFormat:@"%@",data] stringByTrimmingCharactersInSet:characterSet] stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    return passWordStr;
}




@end
