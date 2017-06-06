//
//  Alert.m
//  ehu
//
//  Created by 静默 on 15/12/16.
//  Copyright © 2015年 机智的静默( http://www.cnblogs.com/jingmo/ ). All rights reserved.
//

#import "Alert.h"
#import <objc/runtime.h>

void (^alertBlock)(NSInteger index);
#define alertBlockKey @"UIAlertViewClickButtonBlock"

@interface UIAlertView ()<UIAlertViewDelegate>

@end

@implementation UIAlertView(Block)

- (void)handler:(void (^)(NSInteger))handler {
     
    self.delegate = self;
    
    objc_setAssociatedObject(self, alertBlockKey, handler, OBJC_ASSOCIATION_COPY);
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    alertBlock = objc_getAssociatedObject(self, alertBlockKey);
    
    if (alertBlock) {
        
        alertBlock(buttonIndex);
    }
    alertBlock = nil;
}

@end

void (^actionBlock)(NSInteger index);
#define actionBlockKey @"UIActionSheetClickButtonBlock"

@interface UIActionSheet ()<UIActionSheetDelegate>

@end

@implementation UIActionSheet(Block)

- (void)handler:(void (^)(NSInteger))handler {
    
    self.delegate = self;
    
    objc_setAssociatedObject(self, actionBlockKey, handler, OBJC_ASSOCIATION_COPY);
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    actionBlock = objc_getAssociatedObject(self, actionBlockKey);
    
    if (actionBlock) {
        
        actionBlock(buttonIndex);
    }
    alertBlock = nil;
}

@end


void (^alertControllerBlock)(NSInteger index);
#define alertControllerBlockKey @"UIAlertControllerClickButtonBlock"

@interface UIAlertController ()

@end

@implementation UIAlertController (Block)

+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)message buttonTitles:(NSArray *)buttonTitles alertControllerStyle:(UIAlertControllerStyle)alertControllerStyle handler:(void (^)(NSInteger))handler {
    
    objc_setAssociatedObject(self, alertControllerBlockKey, handler, OBJC_ASSOCIATION_COPY);
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:alertControllerStyle];
    
    [buttonTitles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 0) {
            
            [alertController addAction:[self alertAction:obj style:UIAlertActionStyleCancel index:idx]];
        }else {
            
            [alertController addAction:[self alertAction:obj style:UIAlertActionStyleDefault index:idx]];
        }
    }];
    
    return alertController;
}

+ (UIAlertAction *)alertAction:(NSString*)title style:(UIAlertActionStyle)style index:(NSInteger)index {
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:title style:style handler:^(UIAlertAction * _Nonnull action) {
        
        alertControllerBlock = objc_getAssociatedObject(self, alertControllerBlockKey);
        
        if (alertControllerBlock) {
        
            alertControllerBlock(index);
        }
        
    }];

    return alertAction;
}
@end

