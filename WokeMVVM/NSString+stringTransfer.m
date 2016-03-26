//
//  NSString+stringTransfer.m
//  WokeEnterprise
//
//  Created by 金秋成 on 15/6/8.
//  Copyright (c) 2015年 jin. All rights reserved.
//

#import "NSString+stringTransfer.h"
#import <CommonCrypto/CommonDigest.h>
@implementation NSString (stringTransfer)
-(NSString *)hexString{
    return [NSString hexStringFromData:[self dataUsingEncoding:NSUTF8StringEncoding]];
}
-(NSString *)md5Sum{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}
+ (NSString *)hexStringFromData:(NSData *)myD{
    Byte * bytes = (Byte *)[myD bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr=@"";
    for(int i=0;i<[myD length];i++)
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];
        if([newHexStr length]==1)
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        else
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    }    
    return hexStr;
}

@end
