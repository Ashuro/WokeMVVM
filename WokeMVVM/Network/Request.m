//
//  Request.m
//  WokeMVVM
//
//  Created by 金秋成 on 16/3/26.
//  Copyright © 2016年 蓝兔子. All rights reserved.
//

#import "Request.h"

@implementation Request
-(NSString *)protocolId{
    return @"0";
}

-(Class)responseClass{
    return [Response class];
}


+(JSONKeyMapper*)keyMapper
{
    return [JSONKeyMapper mapperFromUnderscoreCaseToCamelCase];
}

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}
@end
