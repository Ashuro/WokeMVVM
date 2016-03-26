//
//  Request.h
//  WokeMVVM
//
//  Created by 金秋成 on 16/3/26.
//  Copyright © 2016年 蓝兔子. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "HttpProtocol.h"
#import "Response.h"
@interface Request : JSONModel<HttpRequestProtocol>

@end
