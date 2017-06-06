//
//  MyUtil+Encryption.h
//  ServiceStation
//
//  Created by msc on 17/1/13.
//  Copyright © 2017年 Ehu. All rights reserved.
//

#import "MyUtil.h"

@interface MyUtil (Encryption)

/** hmac_sha1加密 */
+ (NSString *)hmac_sha1:(NSString *)key text:(NSString *)text;

//MD5加密(32位小写)
+ (NSString *)md5:(NSString *)str;


///** rsa加密字符串 */
//+(NSString*) rsaEncryptString:(NSString*)string;
///** rsa解密字符串 */
//+(NSString*) rsaDecryptString:(NSString*)string;
///** rsa签名 */
//+(NSString *)signString:(NSString *)string;
///** rsa验证 */
//+(BOOL)verifyString:(NSString *)string withSign:(NSString *)sign;
//
///** 获取公钥字符串 */
//+(NSString *)rsaPublickKeyStr;

@end
