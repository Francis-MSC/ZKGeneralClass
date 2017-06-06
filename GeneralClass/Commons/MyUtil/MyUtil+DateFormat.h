//
//  MyUtil+DateFormat.h
//  General
//
//  Created by msc on 16/12/27.
//  Copyright © 2016年 msc. All rights reserved.
//

#import "MyUtil.h"

@interface MyUtil (DateFormat)

/** 根据日期格式返回字符串 */
+(NSString *)formatDate:(NSDate *)date formatStr:(NSString *)formatStr;

/** 根据日期格式返回日期 */
+(NSDate *)dateStr:(NSString *)dateStr formatStr:(NSString *)formatStr;

/** 某年某月有多少天 */
+(NSInteger)numberOfDaysInYear:(NSInteger)year month:(NSInteger)month;

/** 俩个日期之间有多少天 */
+ (NSInteger) calcDaysFromBegin:(NSString *)beginDate end:(NSString *)endDate formatStr:(NSString *)formatStr;

/** 根据距1970年的时间间隔s数，获取当前日期：yyyy-MM-dd HH:mm */
+(NSString *)dateStrWithTimeIntervalSince1970:(NSTimeInterval)ti;

/** 获取服务器时间（默认为设备当前时间，当后台接口返回systemTime字段时，将时间更新为对应的时间） */
+(NSString *)getSystemTime;

/** 保存系统时间(将后台接口返回的system时间保存) */
+(void)saveSystemTime:(NSString *)systemTime;

@end
