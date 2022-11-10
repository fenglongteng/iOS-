//
//  UIImageView+LocalImageView.m
//  PickfunForeign
//
//  Created by Carl on 2022/9/23.
//

#import "LocalImageView+Local.h"
#import <objc/runtime.h>


@implementation LocalImageView (Local)

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
    });
}



/// 替换xid和storyboard文字
-(void)CFAwakeFromNib{
    [self CFAwakeFromNib];
   
    if(self.imglocalName.length > 0){
        UIImage *image = [UIImage imageNamed:self.imglocalName];
        if (image) {
            self.image = image;
        }
    }
    
}

@end
