//
//  DetailVC.m
//  HqLocal
//
//  Created by hehuiqi on 2018/1/14.
//  Copyright © 2018年 hehuiqi. All rights reserved.
//

#import "DetailVC.h"
#import "AppDelegate.h"
#import "HqLocalTool.h"
@interface DetailVC ()

@end

@implementation DetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *language =HQGetLanguage();
    NSLog(@"模拟器语言切换之前：%@",language);

    self.title =  HQLocalizedString(@"hq_detail");
//    self.title =  HQLocalizedStringFromTable(@"hq_detail", @"HqLocalizable");
    
    
    
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"英文",@"中文"]];
    
    if ([language isEqualToString:@"en"]) {
        segment.selectedSegmentIndex = 0;
    }else{
        segment.selectedSegmentIndex = 1;
    }
    segment.frame = CGRectMake(30, 100, 200, 40);
    [self.view addSubview:segment];
    [segment addTarget:self action:@selector(changeLauange:) forControlEvents:UIControlEventValueChanged];
}
- (void)changeLauange:(UISegmentedControl *)segment{
    
    NSString *lanuage = @"en";
    if (segment.selectedSegmentIndex==0) {
        lanuage = @"en";
    }else{
        lanuage = @"zh-Hans";
    }
    HQSetLanguage(lanuage);
    
    NSString *language = HQGetLanguage();
    NSLog(@"模拟器语言切换之后：%@",language);
    [self resetRootViewController];
    [self.navigationController popViewControllerAnimated:YES];
}
//重新设置
-(void)resetRootViewController
{
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *rootNav = [storyBoard instantiateViewControllerWithIdentifier:@"root"];
    app.window.rootViewController = rootNav;
    [app.window makeKeyAndVisible];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
