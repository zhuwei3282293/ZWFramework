//
//  ZWHomeViewController.m
//  ZWFramework
//
//  Created by joon on 2017/3/20.
//  Copyright © 2017年 joon. All rights reserved.
//

#import "ZWHomeViewController.h"

@interface ZWHomeViewController ()

@end

@implementation ZWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel * title = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    [title setText:@"我是首页"];
    [title setTextColor:[UIColor blackColor]];
    [title setFont:[UIFont systemFontOfSize:16.0]];
    [self.view addSubview:title];
    
    self.title = @"我是首页";
    [self.view setBackgroundColor:[UIColor grayColor]];
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
