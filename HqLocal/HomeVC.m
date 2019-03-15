//
//  ViewController.m
//  HqLocal
//
//  Created by hehuiqi on 2018/1/14.
//  Copyright © 2018年 hehuiqi. All rights reserved.
//

#import "HomeVC.h"
#import "HqLocalTool.h"
#import "AppDelegate.h"
#import "DetailVC.h"
@interface HomeVC ()

@end

@implementation HomeVC
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // 切换语言前
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     在Xcode中设置启动语言
     Edit->Scheme->Run->Arguments Passed On Launch ->AppleLanguages(en)
     英文 zh-Hans
     中文 en
     NSString *str  = NSLocalizedString(@"Click Screen Enter Next", nil);
     */
    
    self.title =  HQLocalizedString(@"hq_home");
//    self.title =  HQLocalizedStringFromTable(@"hq_home", @"HqLocalizable");
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLange) name:@"languageChange" object:nil];
}
- (void)changeLange{
//    [self.navigationController pushViewController:detailVC animated:NO];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        DetailVC *detailVC =[[DetailVC alloc] init];
        [self presentViewController:detailVC animated:NO completion:nil];
        [self resetRootViewController];
    });
}

//重新设置
-(void)resetRootViewController
{
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *rootNav = [storyBoard instantiateViewControllerWithIdentifier:@"root"];
    app.window.rootViewController = rootNav;
//    [app.window makeKeyAndVisible];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    DetailVC *detailVC =[[DetailVC alloc] init];
//    [self.navigationController pushViewController:detailVC animated:YES];
    [self presentViewController:detailVC animated:YES completion:nil];

}

@end
