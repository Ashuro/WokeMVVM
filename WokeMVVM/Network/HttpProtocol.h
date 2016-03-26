//
//  HttpRequestProtocol.h
//  WokeMVVM
//
//  Created by 金秋成 on 16/3/26.
//  Copyright © 2016年 蓝兔子. All rights reserved.
//

#ifndef HttpRequestProtocol_h
#define HttpRequestProtocol_h



@protocol HttpResponseProtocol <NSObject>
-(NSString *)jsessionid;
-(NSInteger )status;
-(NSString *)memo;
@end

@protocol HttpRequestProtocol <NSObject>
-(NSString *)toJSONString;
-(NSString *)protocolId;
-(Class)responseClass;
@end

#endif /* HttpRequestProtocol_h */
