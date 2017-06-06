//
//  MyUtil+DateFormat.m
//  General
//
//  Created by msc on 16/12/27.
//  Copyright © 2016年 msc. All rights reserved.
//

#import "MyUtil+DateFormat.h"

static NSString *SystemTime = nil;

@implementation MyUtil (DateFormat)

/** 获取线程安全的单例 */
+(NSDateFormatter *)singleInstanceWithFormatStr:(NSString *)formatStr{
    NSMutableDictionary *threadDict = [NSThread currentThread].threadDictionary;
    NSDateFormatter *dateFormat = [threadDict objectForKey:formatStr];
    if (!dateFormat) {
        @synchronized (self) {
            if (!dateFormat) {
                dateFormat = [[NSDateFormatter alloc] init];
                [dateFormat setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
                [dateFormat setDateFormat:formatStr];
                [threadDict setObject:dateFormat forKey:formatStr];
            }
        }
    }
    return dateFormat;
}

/** 根据日期格式返回字符串 */
+(NSString *)formatDate:(NSDate *)date formatStr:(NSString *)formatStr{
    if (date && formatStr) {
        NSDateFormatter *dateFormat = [self singleInstanceWithFormatStr:formatStr];
        NSString *dateTimeStr = [dateFormat stringFromDate:date];
        return dateTimeStr;
    }
    return @"";
}

/** 根据日期格式返回日期 */
+(NSDate *)dateStr:(NSString *)dateStr formatStr:(NSString *)formatStr{
    if (dateStr && formatStr) {
        NSDateFormatter *dateFormat = [self singleInstanceWithFormatStr:formatStr];
        NSDate *date = [dateFormat dateFromString:dateStr];
        return date;
    }
    return nil;
}

/** 某年某月有多少天 */
+(NSInteger)numberOfDaysInYear:(NSInteger)year month:(NSInteger)month{
    
    if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
        return 31;
    }
    
    if (month == 2) {
        /** 闰年二月29天 */
        if (year % 400 == 0) {
            return 29;
        }
        
        if (year%100 != 0 && year%4 == 0) {
            return 29;
        }
        
        return 28;
    }
    
    return 30;
}

/** 俩个日期差几天 */
+ (NSInteger) calcDaysFromBegin:(NSString *)beginDate end:(NSString *)endDate formatStr:(NSString *)formatStr
{

    NSDateFormatter *dateFormat = [self singleInstanceWithFormatStr:formatStr];
    NSDate * begin = [dateFormat dateFromString:beginDate];
    NSDate * end = [dateFormat dateFromString:endDate];
    NSTimeInterval time=[end timeIntervalSinceDate:begin];
    
    int days=((int)time)/(3600*24);
    //int hours=((int)time)%(3600*24)/3600;
    //NSString *dateContent=[[NSString alloc] initWithFormat:@"%i天%i小时",days,hours];
    return days;
}

/** 根据距1970年的时间间隔s数，获取当前日期：yyyy-MM-dd HH:mm */
+(NSString *)dateStrWithTimeIntervalSince1970:(NSTimeInterval)ti{
    /** 要转成北京时间 */
    ti = ti+8*60*60;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:ti];
    return [self formatDate:date formatStr:@"yyyy-MM-dd HH:mm"];
}

/** 获取服务器时间（默认为设备当前时间，当后台接口返回systemTime字段时，将时间更新为对应的时间） */
+(NSString *)getSystemTime{
    if (SystemTime.length > 0) {
        return SystemTime;
    }else{
//        NSDate *date = [NSDate date];
        NSString *timeStr = [MyUtil formatDate:[NSDate date] formatStr:@"yyyy.MM.dd HH:mm:ss"];
        return timeStr;
    }
}

/** 保存系统时间(将后台接口返回的system时间保存) */
+(void)saveSystemTime:(NSString *)systemTime{
    if (systemTime.length > 0) {
        if (systemTime.length == 16) {
            systemTime = [systemTime stringByAppendingString:@":00"];
        }
        SystemTime = systemTime;
    }
}

@end
