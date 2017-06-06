//
//  NSAttributedString+Mutable.m
//  ServiceStation
//
//  Created by msc on 17/1/2.
//  Copyright © 2017年 Ehu. All rights reserved.
//

#import "NSAttributedString+Mutable.h"

@implementation NSAttributedString (Mutable)


/** 根据关键字更改颜色和字体 */
+ (NSAttributedString *)attributeStringWithText:(NSString *)text keyWords:(NSArray *)keyWords colors:(NSArray *)colors fonts:(NSArray *)fonts repeat:(BOOL)repeat
{
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:text];
    if (keyWords) {
        [keyWords enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSMutableString *tmpString=[NSMutableString stringWithString:text];
            NSRange range=[text rangeOfString:obj];
            NSInteger location=0;
            UIColor *color=nil;
            if (idx < colors.count) {
                color = colors[idx];
            }
            UIFont *font = nil;
            if (idx < fonts.count) {
                font = fonts[idx];
            }
            
            if (color || font) {
                while (range.length>0) {
                    if (color) {
                        [attString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(location+range.location, range.length)];
                    }
                    if (font) {
                        [attString addAttribute:NSFontAttributeName value:font range:NSMakeRange(location+range.location, range.length)];
                    }
                    
                    location+=(range.location+range.length);
                    NSString *tmp= [tmpString substringWithRange:NSMakeRange(range.location+range.length, text.length-location)];
                    tmpString=[NSMutableString stringWithString:tmp];
                    range=[tmp rangeOfString:obj];
                    if (!repeat) {
                        break;
                    }
                }
            }
        }];
    }
    
    return attString;
}

/** 根据位置更改文字颜色和字体 */
+ (NSAttributedString *)attributeStringWithText:(NSString *)text color:(UIColor *)color font:(UIFont *)font range:(NSRange)range{
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:text];
    
    if (text.length >= range.location+range.length) {
        if (color) {
            [attString addAttribute:NSForegroundColorAttributeName value:color range:range];
        }
        if (font) {
            [attString addAttribute:NSFontAttributeName value:font range:range];
        }
    }
    
    return attString;
}


/** 更改文字颜色和字体,行间距 */
+ (NSAttributedString *)attributeStringWithText:(NSString *)text color:(UIColor *)color font:(UIFont *)font lineSpace:(CGFloat)lineSpace{
    NSMutableParagraphStyle *ps = [[NSMutableParagraphStyle alloc] init];
    ps.lineSpacing = lineSpace;
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:text attributes:@{NSParagraphStyleAttributeName:ps}];
    if (color) {
        [attString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, text.length)];
    }
    if (font) {
        [attString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, text.length)];
    }
    return attString;
}

+ (NSAttributedString *)attributeStringWithContent:(NSString *)content keyWords:(NSArray *)keyWords backColors:(NSArray *)backColors colors:(NSArray *)colors {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:content];
    
    [keyWords enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [attributedString addAttribute:NSBackgroundColorAttributeName value:[backColors objectAtIndex:idx] range:[content rangeOfString:obj]];
        
        [attributedString addAttribute:NSForegroundColorAttributeName value:[colors objectAtIndex:idx] range:[content rangeOfString:obj]];
    }];
    
    return attributedString;
}
@end
