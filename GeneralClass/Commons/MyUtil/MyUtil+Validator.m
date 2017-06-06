//
//  MyUtil+Validator.m
//  ServiceStation
//
//  Created by msc on 2017/4/12.
//  Copyright © 2017年 Ehu. All rights reserved.
//

#import "MyUtil+Validator.h"

@implementation MyUtil (Validator)

/** 验证手机号（11位数字） */
+(BOOL)validateMobilePhoneNumber:(NSString *)number{
    NSString *regex = @"^[0-9]{11}";
    return [self isValidateByRegex:regex withStr:number];
}

/** 是否邮箱 */
+(BOOL)validateEmailAddress:(NSString *)emailAddress {
    NSString *regex = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\\\.[A-Za-z]{2,4}";
    return [self isValidateByRegex:regex withStr:emailAddress];
}

/** 是否密码（6～18位数字或字母） */
+(BOOL)validatePassword:(NSString *)passWord {
    NSString *regex = @"^[a-zA-Z0-9_]{6,18}$";
    return [self isValidateByRegex:regex withStr:passWord];
}

/** 是否网址（ip或域名） */
+(BOOL)validateUrlStr:(NSString *)urlStr {
    NSString *regex = @"(https?|ftp|file)://[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|]";
    return [self isValidateByRegex:regex withStr:urlStr];
}


/** 是否纯汉字 */
+(BOOL)validateChinese:(NSString *)chinese {
    NSString *regex = @"^[\\u4e00-\\u9fa5]+$";
    return [self isValidateByRegex:regex withStr:chinese];
}


#pragma mark------------正则匹配方法
+ (BOOL)isValidateByRegex:(NSString *)regex withStr:(NSString *)str{
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pre evaluateWithObject:str];
}

@end
