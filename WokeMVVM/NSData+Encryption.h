//
//  NSData+Encryption.h
//  woke
//
//  Created by Ashuro on 15/7/6.
//  Copyright (c) 2015年 Ashuro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Encryption)

- (NSData *)AES256EncryptWithKey:(NSString *)key;   //加密

- (NSData *)AES256DecryptWithKey:(NSString *)key;   //解密

@end
