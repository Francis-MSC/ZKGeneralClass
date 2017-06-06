//
//  Alert.h
//  ehu
//
//  Created by 静默 on 15/12/16.
//  Copyright © 2015年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView(Block)

/**
 *  ios8之前显示alertView，并返回点击按钮的index
 *
 *  @param handler 返回点击的index
 */
- (void)handler:(void(^)(NSInteger index))handler;

@end


@interface UIActionSheet (Block)

/**
 *  ios8之前显示actionSheet，并返回点击按钮的index
 *
 *  @param handler 返回点击的index
 */
- (void)handler:(void(^)(NSInteger index))handler;

@end


@interface UIAlertController (Block)

/**
 *  ios8之后显示，并返回点击按钮的index
 *
 *  @param title                标题,可为nil
 *  @param message              文本,可为nil
 *  @param buttonTitles         按钮文本，第一个为取消按钮
 *  @param alertControllerStyle alert的类型
 *  @param handler              返回点击的index
 *
 *  @return 返回alertController
 */
+ (instancetype)alertWithTitle:(NSString*)title message:(NSString*)message buttonTitles:(NSArray*)buttonTitles alertControllerStyle:(UIAlertControllerStyle)alertControllerStyle handler:(void(^)(NSInteger index))handler;

@end