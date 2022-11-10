//
//  NSString+Local.m
//  PickfunForeign
//
//  Created by Carl on 2022/9/23.
//

#import "NSString+Local.h"

@implementation NSString (Local)

-(NSString*)getLocalStr{
    NSString *local =  [[NSBundle mainBundle] localizedStringForKey:self value:@"" table:nil];
    return  local;
}

@end
