//
//  MUser.m
//  WokeMVVM
//
//  Created by 金秋成 on 16/3/26.
//  Copyright © 2016年 蓝兔子. All rights reserved.
//

#import "MUser.h"

@implementation MUser
+(JSONKeyMapper*)keyMapper
{
    return [JSONKeyMapper mapperFromUnderscoreCaseToCamelCase];
}

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}
@end
