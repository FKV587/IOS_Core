//
//  CJMD5.m
//  aiyuke
//
//  Created by  on 15/11/24.
//  Copyright © All rights reserved.
//

#import "CJMD5.h"
#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@implementation CJMD5

+(NSString *)md5HexDigest:(NSString *)input
{
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (unsigned int)strlen(cStr), digest );
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02X", digest[i]];
    
    return [output lowercaseString];
}
@end
