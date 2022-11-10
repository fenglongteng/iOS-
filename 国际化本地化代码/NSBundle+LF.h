//
//  NSBundle+LF.h
//  LFInternationalizationDemo
//
//  Created by 张林峰 on 2017/9/3.
//  Copyright © 2017年 张林峰. All rights reserved.
//  参考：https://github.com/zhanglinfeng/LFInternationalizationDemo

#import <Foundation/Foundation.h>

@interface NSBundle (LF)

/// 设置语言 简体中文：zh-Hans  英语：en
+ (void)setMainBundelLanguage:(NSString *)language;

/// 如果你的storyboard生成的多个语言的.storyboard文件，则获取当前storyboard的bundel如下
+ (NSBundle *)getCurrentMainBundel;

// 如果你的storyboard 生成的多个语言的Main.strings文件，则获取当前storyboard的bundel如下
//NSBundle * currentMainBundel = [NSBundle mainBundle];
//UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:currentMainBundel];

/// 切换语言 刷新UI
//[CLLanguageManager setUserLanguage:@"en"];
// CLTabbarController *tabbarController = [[CLTabbarController alloc] init];
//tabbarController.selectedIndex = 3;
//UINavigationController *navigationController = tabbarController.selectedViewController;
//NSMutableArray *viewControllers = navigationController.viewControllers.mutableCopy;
//    //取出我的页面，提前加载，解决返回按钮不变化
// CLMyController *me = (CLMyController *)[viewControllers firstObject];
//[me loadViewIfNeeded];
//    //新建设置语言页面
//CLChangeLanguageController *languageController = [[CLChangeLanguageController alloc] init];
//languageController.hidesBottomBarWhenPushed = YES;
//[viewControllers addObject:languageController];
//    //解决奇怪的动画bug。
//dispatch_async(dispatch_get_main_queue(), ^{
//    [WindowTool getKeyWindow].rootViewController = tabbarController;
//    navigationController.viewControllers = viewControllers;
//    CLLog(@"已切换到语言 %@", [NSBundle currentLanguage]);
//});

@end
