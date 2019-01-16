//
//  SFAlertController.m
//  SoonforDemo
//
//  Created by Dev SoonFor on 2018/9/11.
//  Copyright © 2018年 Dev SoonFor. All rights reserved.
//

#import "SFAlertController.h"

@implementation SFAlertController
+ (void)AlertViewWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle acitons:(NSArray *)actionsArr style:(SFAlertViewStyle)style inView:(UIView*)toView itemblock:(clickBlock)itemBlock{
    
    UIViewController *controller = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    UIAlertControllerStyle alertStyle;
    
    if (!style) {
        
        alertStyle = UIAlertControllerStyleAlert;
        
    }else{
        
        alertStyle = UIAlertControllerStyleActionSheet;
        
    }
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:alertStyle];
    
    UIPopoverPresentationController *popover = alertController.popoverPresentationController;
    
    if (popover && SFIsIpad) {
        
        popover.sourceView = toView;
        popover.sourceRect = toView.bounds;
        popover.permittedArrowDirections = UIPopoverArrowDirectionDown;
    }
    
    [alertController addAction:[UIAlertAction actionWithTitle:cancelTitle.length > 0? cancelTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        
        itemBlock(0);//取消返回0值
        
        
    }]];
    
    
    for (NSInteger i = 0; i < actionsArr.count; i++) {
        
        [alertController addAction:[UIAlertAction actionWithTitle:actionsArr[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            itemBlock(i+1);
            
        }]];
        
    }
    
    [controller presentViewController:alertController animated:YES completion:nil];
    
}

+ (void)alertViewWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle acitons:(NSArray *)actionsArr style:(SFAlertViewStyle)style inView:(UIView *)toView textFieldClickBlock:(textFieldClickBlock)textFieldClickBlock {
    UIViewController *controller = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    UIAlertControllerStyle alertStyle;
    
    if (!style) {
        
        alertStyle = UIAlertControllerStyleAlert;
        
    }else{
        
        alertStyle = UIAlertControllerStyleActionSheet;
        
    }
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:alertStyle];
    
    UIPopoverPresentationController *popover = alertController.popoverPresentationController;
    
    if (popover && SFIsIpad) {
        
        popover.sourceView = toView;
        popover.sourceRect = toView.bounds;
        popover.permittedArrowDirections = UIPopoverArrowDirectionDown;
    }
    
    [alertController addAction:[UIAlertAction actionWithTitle:cancelTitle.length > 0? cancelTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        textFieldClickBlock(0,alertController.textFields[0]);
        
    }]];
    
    
    for (NSInteger i = 0; i < actionsArr.count; i++) {
        
        [alertController addAction:[UIAlertAction actionWithTitle:actionsArr[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            textFieldClickBlock(i+1,alertController.textFields[0]);
            
        }]];
        
    }
    
    [controller presentViewController:alertController animated:YES completion:nil];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
