//
//  UIView+Additions.m
//  MyWeiBo20131118
//
//  Created by Jay Chen on 13-12-10.
//  Copyright (c) 2013年 www.usportnews.com U体育. All rights reserved.


#import "UIView+Additions.h"

@implementation UIView (Additions)

#pragma mark 给UIView加的一个类目方法，通过View可以拿到ViewController
- (UIViewController *)viewController{
    UIResponder *next = [self nextResponder];
    do{
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
        
    }while (next!=nil);
        
    return nil;
}

//#pragma mark 给UIView加的一个类目方法，通过View可以拿到BaseViewController
//- (BaseViewController *)baseViewController
//{
//    UIResponder *next = [self nextResponder];
//    do{
//        if ([next isKindOfClass:[BaseViewController class]]) {
//            return (BaseViewController *)next;
//        }
//        next = [next nextResponder];
//        
//    }while (next!=nil);
//    
//    return nil;
//}

@end
