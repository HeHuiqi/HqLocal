//
//  HqLocalTool.h
//  HqLocal
//
//  Created by hehuiqi on 2018/1/14.
//  Copyright © 2018年 hehuiqi. All rights reserved.
//

#import <Foundation/Foundation.h>

#define HQLocalizedString(key)  [[HqLocalTool share] hqLocalizedStringKey:(key)]

#define HQLocalizedStringFromTable(key,tab) [[HqLocalTool share] hqLocalizedStringKey:(key) localizedFilename:(tab)]

//收到通知或者改变语言后注意重新渲染页面或者重新初始化根控制器
#define HQLanguageChangedNotification @"HQLanguageChangedNotification"
#define HQSetLanguage(language) [[HqLocalTool share] setLanguage:(language)]
#define HQGetLanguage() [[HqLocalTool share] getCurrentLanguage]

@interface HqLocalTool : NSObject

+ (instancetype)share;

- (NSString *)getCurrentLanguage;

- (void)setLanguage:(NSString *)language;

- (NSString *)hqLocalizedStringKey:(NSString *)key;

- (NSString *)hqLocalizedStringKey:(NSString *)key localizedFilename:(NSString *)filename;

@end
