//
//  UIImage+Local.m
//  PickfunForeign
//
//  Created by Carl on 2022/9/23.
//

#import "UIImage+Local.h"
#import <objc/runtime.h>

#import "NSString+Local.h"


@implementation UIImage (Local)

+(void)load {
    [super load];
    //只执行一次这个方法
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        Method otherMehtod = class_getClassMethod(class, @selector(swizzled_imageNamed:));
        Method originMehtod = class_getClassMethod(class, @selector(imageNamed:));
        // 交换2个方法的实现
        method_exchangeImplementations(otherMehtod, originMehtod);
    });

}

+ (UIImage *)swizzled_imageNamed:(NSString *)name {
    return [self swizzled_imageNamed:[name getLocalStr]];
}




@end
