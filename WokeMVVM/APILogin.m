//
//  APILogin.m
//  WokeMVVM
//
//  Created by 金秋成 on 16/3/26.
//  Copyright © 2016年 蓝兔子. All rights reserved.
//

#import "APILogin.h"

@implementation APILoginRequest
-(NSString *)protocolId{
    return @"0070";
}

-(Class)responseClass{
    return [APILoginResponse class];
}
@end


@implementation APILoginResponse


@end
