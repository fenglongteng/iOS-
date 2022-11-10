//
//  UIButton+Local.m
//  PickfunForeign
//
//  Created by Carl on 2022/9/23.
//

#import "UIButton+Local.h"
#import <objc/runtime.h>
#import "NSString+Local.h"


@implementation UIButton (Local)
+(void)load {
    [super load];
    //只执行一次这个方法
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
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
        
        
        
        //替换加载完成后的方法
        SEL originalSelector1 = @selector(setTitle:forState:);
        SEL swizzledSelector1 = @selector(CFSetTitle:forState:);
         Method originalMethod1 = class_getInstanceMethod(class, originalSelector1);
         Method swizzledMethod1 = class_getInstanceMethod(class, swizzledSelector1);
         BOOL didAddMethod1 =
         class_addMethod(self,
                         originalSelector1,
                         method_getImplementation(swizzledMethod1),
                         method_getTypeEncoding(swizzledMethod1));
         if(didAddMethod1){
             class_replaceMethod(self,
                                 swizzledSelector1,
                                 method_getImplementation(originalMethod1),
                                 method_getTypeEncoding(originalMethod1));
         }else{
             method_exchangeImplementations(originalMethod1, swizzledMethod1);
         }
        
        
    });
}



/// 替换xid和storyboard文字
-(void)CFAwakeFromNib{
    [self CFAwakeFromNib];
    
    NSString*nt =  [self titleForState:UIControlStateNormal];
    if ([nt getLocalStr].length>0){
        [self setTitle:[nt getLocalStr] forState:UIControlStateNormal];
    }
    
    NSString*st =  [self titleForState:UIControlStateSelected];
    if ([st getLocalStr].length>0){
        [self setTitle:[st getLocalStr] forState:UIControlStateNormal];
    }
    
}



-(void)CFSetTitle:(NSString *)title forState:(UIControlState)state{
    [self CFSetTitle:[title getLocalStr] forState:state];
}



@end
