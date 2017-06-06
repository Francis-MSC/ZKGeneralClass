//
//  MyUtil+LabelText.m
//  General
//
//  Created by msc on 16/12/21.
//  Copyright © 2016年 msc. All rights reserved.
//

#import "MyUtil+LabelText.h"

@implementation MyUtil (LabelText)

/** 根据最大高度返回文本宽度 */
+(CGFloat)textWidthWithFont:(UIFont *)font maxHeight:(CGFloat)maxHeight text:(NSString *)text{
    if (!text || text.length<1) {
        return 0;
    }
    NSDictionary *attr = @{NSFontAttributeName : font};
    CGSize size = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, maxHeight)
                                     options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                  attributes:attr
                                     context:nil].size;
    return size.width;
}

/** 根据最大宽度返回文本高度 */
+(CGFloat)textHeightWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth text:(NSString *)text{
    if (!text || text.length<1) {
        return 0;
    }
    NSDictionary *attr = @{NSFontAttributeName : font};
    CGSize size = [text boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT)
                                     options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                  attributes:attr
                                     context:nil].size;
    return size.height;
}

/** 根据行间距及文本最大宽度返回文本高度，如果是单行，返回的高度是不带行间距的 */
+(CGFloat)textHeightWithFont:(UIFont *)font lineSpace:(CGFloat)lineSpace maxWidth:(CGFloat)maxWidth text:(NSString *)text{
    if (!text || text.length<1) {
        return 0;
    }
    /** 先判断是否多行 */
    if ([self textWidthWithFont:font maxHeight:MAXFLOAT text:text]>maxWidth) {
        /** 多行 */
        NSMutableParagraphStyle *ps = [[NSMutableParagraphStyle alloc] init];
        ps.lineSpacing = lineSpace;
        NSAttributedString *attStr = [[NSAttributedString alloc] initWithString:text attributes:@{NSParagraphStyleAttributeName:ps,NSFontAttributeName:font}];
        CGSize size = [attStr boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT)
                                         options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                         context:nil].size;
        return size.height;
    }else{
        /** 返回单行高度 */
        return font.lineHeight;
    }
}

@end
