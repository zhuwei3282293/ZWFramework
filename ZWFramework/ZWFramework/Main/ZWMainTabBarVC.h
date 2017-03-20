//
//  ZWMainTabBarVC.h
//  ZWArchitecture
//
//  Created by joon on 2017/3/2.
//  Copyright © 2017年 joon. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "ZWTabBar.h"

typedef NS_ENUM(NSUInteger, MainViewIndex){
    MAIN_VIEW_HOME  =  0,
    MAIN_VIEW_TWO =  1,
    MAIN_VIEW_THREE  = 2,
    MAIN_VIEW_FOUR =  3
};

@interface ZWMainTabBarVC : UITabBarController{
    ZWTabBar* _ZWTabBar;
    //选中颜色
    UIColor* _selectColor;
    //选中标记
    NSMutableDictionary *_selectIndexDictionary;
}


//tabbar高度
@property CGFloat tabBarHeight;
//单例模式
+ (instancetype)sharedInstance;
//损毁
+ (void)destory;


//隐藏TabBar
-(void)hideTabBar;
//显示TabBar
-(void)showTabBar;
@end

