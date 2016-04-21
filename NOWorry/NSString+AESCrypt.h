//
//  NSString+AESCrypt.h
//  test
//
//  Created by 司浩杰 on 16/1/17.
//  Copyright © 2016年 司浩杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSData+AESCrypt.h"

@interface NSString (AESCrypt)

- (NSString *)AES128EncryptWithKey:(NSString *)key;
- (NSString *)AES128DecryptWithKey:(NSString *)key;
-(NSString *)sha1ith64Base;
@end
