//
//  ViewController.m
//  HqLocal
//
//  Created by hehuiqi on 2018/1/14.
//  Copyright © 2018年 hehuiqi. All rights reserved.
//

#import "HomeVC.h"
#import "HqLocalTool.h"

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
    self.title =  HQLocalizedString(@"hq_home");
    self.title =  HQLocalizedStringFromTable(@"hq_home", @"HqLocalizable");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    DetailVC *detailVC =[[DetailVC alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
