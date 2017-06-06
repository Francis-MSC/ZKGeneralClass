//
//  MyUtil+Validator.h
//  ServiceStation
//
//  Created by msc on 2017/4/12.
//  Copyright © 2017年 Ehu. All rights reserved.
//

#import "MyUtil.h"

@interface MyUtil (Validator)

/** 验证手机号（11位数字） */
+(BOOL)validateMobilePhoneNumber:(NSString *)number;

/** 是否邮箱 */
+(BOOL)validateEmailAddress:(NSString *)emailAddress;

/** 是否密码（6～18位数字或字母） */
+(BOOL)validatePassword:(NSString *)passWord;

/** 是否网址（ip或域名） */
+(BOOL)validateUrlStr:(NSString *)urlStr;

@end
