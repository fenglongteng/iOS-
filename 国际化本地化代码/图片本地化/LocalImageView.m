//
//  CustomImage.m
//  PickfunForeign
//
//  Created by Carl on 2022/9/23.
//

#import "LocalImageView.h"
#import "NSString+Local.h"

@implementation LocalImageView

-(void)setImglocalName:(NSString *)imglocalName{
    _imglocalName = imglocalName;
    self.image = [UIImage imageNamed:imglocalName.getLocalStr];
}

@end
