//
//  NSAttributedString+Mutable.h
//  ServiceStation
//
//  Created by msc on 17/1/2.
//  Copyright © 2017年 Ehu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSAttributedString (Mutable)

/** 根据关键字更改颜色和字体 */
+ (NSAttributedString *)attributeStringWithText:(NSString *)text keyWords:(NSArray *)keyWords colors:(NSArray *)colors fonts:(NSArray *)fonts repeat:(BOOL)repeat;

/** 根据位置更改文字颜色和字体 */
+ (NSAttributedString *)attributeStringWithText:(NSString *)text color:(UIColor *)color font:(UIFont *)font range:(NSRange)range;

/** 更改文字颜色和字体,行间距 */
+ (NSAttributedString *)attributeStringWithText:(NSString *)text color:(UIColor *)color font:(UIFont *)font lineSpace:(CGFloat)lineSpace;

/** 根据关键字更改字体颜色,背景颜色和字体 */
+ (NSAttributedString *)attributeStringWithContent:(NSString *)content keyWords:(NSArray *)keyWords backColors:(NSArray *)backColors colors:(NSArray *)colors;
@end
