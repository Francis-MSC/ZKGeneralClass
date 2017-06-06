//
//  UIView+Frame.h
//  ServiceStation
//
//  Created by msc on 16/12/28.
//  Copyright © 2016年 Ehu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

/** 左边X */
@property (nonatomic, assign) CGFloat x;
/** 顶部Y */
@property (nonatomic, assign) CGFloat y;


/** 右边X */
@property (nonatomic, assign) CGFloat xRight;
/** 底部Y */
@property (nonatomic, assign) CGFloat yBottom;


/** 中心X */
@property (nonatomic, assign) CGFloat centerX;
/** 中心Y */
@property (nonatomic, assign) CGFloat centerY;


/** 宽 */
@property (nonatomic, assign) CGFloat width;
/** 高 */
@property (nonatomic, assign) CGFloat height;


/** 大小 */
@property (nonatomic, assign) CGSize size;


/** 坐标点 */
@property (nonatomic, assign) CGPoint origin;


@end
