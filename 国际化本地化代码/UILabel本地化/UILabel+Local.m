//
//  UILabel+CustomFont.m
//  CCTVPoint
//
//  Created by Joe on 2017/6/1.
//  Copyright © 2017年 刘茜童. All rights reserved.
//

#import "UILabel+Local.h"
#import "NSString+Local.h"
#import <objc/runtime.h>


@implementation UILabel (Local)

+(void)load{
    [super load];
    //只执行一次这个方法
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        //替换set方法
        SEL originalSelector = @selector(setText:);
        SEL swizzledSelector = @selector(swizzled_setText:);
        Method originMehtod = class_getInstanceMethod([self class], @selector(setText:));
        Method otherMehtod = class_getInstanceMethod([self class], @selector(swizzled_setText:));
        BOOL didAddMethod =
        class_addMethod(self,
                        originalSelector,
                        method_getImplementation(otherMehtod),
                        method_getTypeEncoding(otherMehtod));
        if (didAddMethod) {
            //添加
            class_replaceMethod(self,
                                swizzledSelector,
                                method_getImplementation(originMehtod),
                                method_getTypeEncoding(originMehtod));
        }
        else {
            // 交换2个方法的实现
            method_exchangeImplementations(otherMehtod, originMehtod);
        }
        
       //替换加载完成后的方法
        SEL originalSelector3 = @selector(awakeFromNib);
        SEL swizzledSelector3 = @selector(CFAwakeFromNib);
        Method originalMethod3 = class_getInstanceMethod(class, originalSelector3);
        Method swizzledMethod3 = class_getInstanceMethod(class, swizzledSelector3);
        BOOL didAddMethod3 =
        class_addMethod(self,
                        originalSelector3,
                        method_getImplementation(swizzledMethod3),
                        method_getTypeEncoding(swizzledMethod3));
        if(didAddMethod3){
            class_replaceMethod(self,
                                swizzledSelector3,
                                method_getImplementation(originalMethod3),
                                method_getTypeEncoding(originalMethod3));
        }else{
            method_exchangeImplementations(originalMethod3, swizzledMethod3);
        }
    });
    
}

/// 替换xid和storyboard文字
-(void)CFAwakeFromNib{
    [self CFAwakeFromNib];
    
    [self setText:self.text];
}

///替换set方法
- (void)swizzled_setText:(NSString *)string {
    [self swizzled_setText:[string getLocalStr]];
}

@end


