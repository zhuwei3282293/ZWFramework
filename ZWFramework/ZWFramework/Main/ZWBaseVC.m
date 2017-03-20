//
//  ZZBaseVC.m
//  ZZArchitecture
//
//  Created by joon on 2017/3/2.
//  Copyright © 2017年 joon. All rights reserved.
//

#import "ZWBaseVC.h"

@interface ZWBaseVC ()

@end

@implementation ZWBaseVC
-(instancetype)init{
    self=[super init];
    if(self){
        self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(ZWMainTabBarVC *)mainVC{
    return [ZWMainTabBarVC sharedInstance];
}
- (AppDelegate *)appDelegate{
    if(!_appDelegate){
        UIApplication *application = [UIApplication sharedApplication];
        _appDelegate = (AppDelegate *)application.delegate;
    }
    return _appDelegate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *sysVersion  =  [UIDevice currentDevice].systemVersion;
    CGFloat version  =  [sysVersion floatValue];
    
    
    if(self.navigationController){
        if(version >= 7.0){
            self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
            [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
             self.edgesForExtendedLayout = UIRectEdgeBottom;
        }
        else{
            self.navigationController.navigationBar.tintColor = [UIColor blackColor];
        }

        [self.navigationController.navigationBar setTitleTextAttributes:@{ NSFontAttributeName:[UIFont systemFontOfSize:19], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    }
     self.view.backgroundColor = [UIColor whiteColor];
    

   
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
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
