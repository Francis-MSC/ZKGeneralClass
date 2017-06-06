//
//  MyUtil+Encryption.m
//  ServiceStation
//
//  Created by msc on 17/1/13.
//  Copyright © 2017年 Ehu. All rights reserved.
//

#import "MyUtil+Encryption.h"
#import <CommonCrypto/CommonHMAC.h>
#import <CommonCrypto/CommonCryptor.h>
//#import "HBRSAHandler.h"

@implementation MyUtil (Encryption)

/** hmac_sha1加密 */
+ (NSString *)hmac_sha1:(NSString *)key text:(NSString *)text{
    
    if (!key || !text) {
        
        return @"";
    }
    
    const char *cKey  = [key cStringUsingEncoding:NSUTF8StringEncoding];
    const char *cData = [text cStringUsingEncoding:NSUTF8StringEncoding];
    
    char cHMAC[CC_SHA1_DIGEST_LENGTH];
    
    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    
    NSData *HMAC = [[NSData alloc] initWithBytes:cHMAC length:CC_SHA1_DIGEST_LENGTH];
    
    NSString *hash = [HMAC base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    return hash;
}

//MD5加密(32位小写)
+ (NSString *)md5:(NSString *)str
{
    if (!str || ![str isKindOfClass:[NSString class]]) {
        return @"";
    }
    
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    // This is the md5 call
    NSString * md5 = [NSString stringWithFormat:
                      @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                      result[0], result[1], result[2], result[3],
                      result[4], result[5], result[6], result[7],
                      result[8], result[9], result[10], result[11],
                      result[12], result[13], result[14], result[15]
                      ,result[16],result[17],result[18],result[19],result[20],result[21],result[22],result[23],result[24],result[25],result[26],result[27],result[28],result[29],result[30],result[31]];
    
    md5 = [md5 substringWithRange: NSMakeRange(0,32)];
    md5 = [md5 lowercaseString];
    return md5;
}

///** rsa加密字符串 */
//+(NSString*) rsaEncryptString:(NSString*)string{
//    if (string.length > 0) {
//        HBRSAHandler *handler = [HBRSAHandler new];
//        [handler importKeyWithType:KeyTypePublic andPath:EResource(@"rsa_public_key.pem")];
//        return [handler encryptWithPublicKey:string];
//        
//    }
//
//    return nil;
//}
///** rsa解密字符串 */
//+(NSString*) rsaDecryptString:(NSString*)string{
//    if (string.length > 0) {
//        HBRSAHandler *handler = [HBRSAHandler new];
//        [handler importKeyWithType:KeyTypePrivate andPath:EResource(@"pkcs8_private_key.pem")];
//        return [handler decryptWithPrivatecKey:string];
//    }
//    
//    return nil;
//}
//
///** rsa签名 */
//+(NSString *)signString:(NSString *)string{
//    HBRSAHandler *handler = [HBRSAHandler new];
//    [handler importKeyWithType:KeyTypePrivate andPath:EResource(@"pkcs8_private_key.pem")];
//    return [handler signString:string];
//}
//
///** rsa验证 */
//+(BOOL)verifyString:(NSString *)string withSign:(NSString *)sign{
//    HBRSAHandler *handler = [HBRSAHandler new];
//    [handler importKeyWithType:KeyTypePublic andPath:EResource(@"rsa_public_key.pem")];
//    return [handler verifyString:string withSign:sign];
//}
//
///** 获取公钥字符串 */
//+(NSString *)rsaPublickKeyStr{
//    return [NSString stringWithContentsOfFile:EResource(@"rsa_public_key.pem") encoding:NSUTF8StringEncoding error:nil];
//}


@end
