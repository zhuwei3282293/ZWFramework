//
//  ZWBaseVC.h
//  ZWArchitecture
//
//  Created by joon on 2017/3/2.
//  Copyright © 2017年 joon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZWMainTabBarVC.h"
#import "AppDelegate.h"
@interface ZWBaseVC : UIViewController

@property(strong,nonatomic)ZWMainTabBarVC * mainVC;
@property(strong,nonatomic)AppDelegate * appDelegate;

@end
