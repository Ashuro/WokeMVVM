//
//  VUser.m
//  WokeMVVM
//
//  Created by 金秋成 on 16/3/26.
//  Copyright © 2016年 蓝兔子. All rights reserved.
//

#import "VUser.h"
#import "APILogin.h"
#import "HttpAgent.h"
@implementation VUser

+(RACSignal *)loginWithUserName:(NSString *)username andPassword:(NSString *)password{
    RACSignal * signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        APILoginRequest * login = [[APILoginRequest alloc]init];
        login.username = username;
        login.password = password;
        [[HttpAgent instance]request:login complete:^(APILoginResponse * response, NSError *error) {
            
            if (error) {
                [subscriber sendError:error];
            }
            else{
                [subscriber sendNext:response.user];
            }
            [subscriber sendCompleted];
            
        }];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    return signal;
    
}
@end
