//
//  Response.h
//  WokeMVVM
//
//  Created by 金秋成 on 16/3/26.
//  Copyright © 2016年 蓝兔子. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "HttpProtocol.h"
@interface Response : JSONModel<HttpResponseProtocol>
@property (nonatomic,strong)NSString * jsessionid;
@property (nonatomic,assign)NSInteger  status;
@property (nonatomic,strong)NSString * memo;
@end
