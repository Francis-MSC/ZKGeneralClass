//
//  MyUtil+LabelText.h
//  General
//
//  Created by msc on 16/12/21.
//  Copyright © 2016年 msc. All rights reserved.
//

#import "MyUtil.h"

@interface MyUtil (LabelText)

/** 根据最大高度返回文本宽度 */
+(CGFloat)textWidthWithFont:(UIFont *)font maxHeight:(CGFloat)maxHeight text:(NSString *)text;

/** 根据最大宽度返回文本高度 */
+(CGFloat)textHeightWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth text:(NSString *)text;

/** 根据行间距及文本最大宽度返回文本高度，如果是单行，返回的高度是不带行间距的 */
+(CGFloat)textHeightWithFont:(UIFont *)font lineSpace:(CGFloat)lineSpace maxWidth:(CGFloat)maxWidth text:(NSString *)text;


@end
