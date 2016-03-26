//
//  NSString+stringTransfer.h
//  WokeEnterprise
//
//  Created by 金秋成 on 15/6/8.
//  Copyright (c) 2015年 jin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (stringTransfer)
- (NSString *)hexString;
+ (NSString *)hexStringFromData:(NSData *)myD;
- (NSString *)md5Sum;
@end
