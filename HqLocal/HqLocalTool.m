//
//  HqLocalTool.m
//  HqLocal
//
//  Created by hehuiqi on 2018/1/14.
//  Copyright © 2018年 hehuiqi. All rights reserved.
//

#import "HqLocalTool.h"

@implementation HqLocalTool

+ (instancetype)share{
    static dispatch_once_t onceToken;
    static HqLocalTool *local = nil;
    dispatch_once(&onceToken, ^{
        local = [[HqLocalTool alloc] init];
    });
    return local;
}
- (NSString *)getCurrentLanguage{
    NSArray *languages = [[NSUserDefaults standardUserDefaults] valueForKey:@"AppleLanguages"];
    NSString *language = languages.firstObject;
   
    return language;
}
- (void)setLanguage:(NSString *)language{
    
    [[NSUserDefaults standardUserDefaults] setObject:@[language] forKey:@"AppleLanguages"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSNotificationCenter defaultCenter] postNotificationName:HQLanguageChangedNotification object:language];
}
- (NSString *)hqLocalizedStringKey:(NSString *)key{
    NSString *language = [self getCurrentLanguage];
    NSString *lpath = [[NSBundle mainBundle] pathForResource:language ofType:@".lproj"];
    NSBundle *lbundle = [NSBundle bundleWithPath:lpath];
    return  NSLocalizedStringFromTableInBundle(key,
                                               @"Localizable",
                                               lbundle,
                                               nil);
}
- (NSString *)hqLocalizedStringKey:(NSString *)key localizedFilename:(NSString *)filename{
    NSString *language = [self getCurrentLanguage];
    NSString *lpath = [[NSBundle mainBundle] pathForResource:language ofType:@".lproj"];
    NSBundle *lbundle = [NSBundle bundleWithPath:lpath];
   return  NSLocalizedStringFromTableInBundle(key,
                                       filename,
                                       lbundle,
                                       nil);
}
@end
