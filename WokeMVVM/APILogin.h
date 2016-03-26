//
//  APILogin.h
//  WokeMVVM
//
//  Created by 金秋成 on 16/3/26.
//  Copyright © 2016年 蓝兔子. All rights reserved.
//

#import "Request.h"
#import "MUser.h"
@interface APILoginRequest : Request
@property (nonatomic,strong)NSString * username;
@property (nonatomic,strong)NSString * password;
@end

@interface APILoginResponse : Response
@property (nonatomic,strong)MUser * user;
@end

