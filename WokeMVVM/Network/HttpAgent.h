//
//  HttpAgent.h
//  WokeMVVM
//
//  Created by 金秋成 on 16/3/26.
//  Copyright © 2016年 蓝兔子. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpProtocol.h"

typedef void(^RequestBlock)(id<HttpResponseProtocol> response,NSError * error);

@interface HttpAgent : NSObject
+(instancetype)instance;
-(NSURLSessionDataTask *)request:(id<HttpRequestProtocol>)protocol complete:(RequestBlock)complete;
@end
