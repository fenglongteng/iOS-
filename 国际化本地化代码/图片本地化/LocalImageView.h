//
//  CustomImage.h
//  PickfunForeign
//
//  Created by Carl on 2022/9/23.
//  本地化图片基类
 
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LocalImageView : UIImageView

//注意:加上 IBInspectable 就可以可视化显示相关的属性
@property (nonatomic, copy) IBInspectable NSString* imglocalName;

@end

NS_ASSUME_NONNULL_END
