//
//  ZWMainTabBarVC.m
//  ZWArchitecture
//
//  Created by joon on 2017/3/2.
//  Copyright © 2017年 joon. All rights reserved.
//

//
//  MainVC.m
//  miyu
//
//  Created by MiJie on 15/7/3.
//  Copyright (c) 2015年 qiuyun. All rights reserved.
//
//  程序Main类
#import "ZWMainTabBarVC.h"

#import "ZWHomeViewController.h"
#import "ZWTwoViewController.h"
#import "ZWThreeViewController.h"
#import "ZWFourViewController.h"

@interface ZWMainTabBarVC()
//正常情况下图片列表
@property (strong, nonatomic) NSMutableArray * normalImages;
//按下后图片列表
@property (strong, nonatomic) NSMutableArray * pressedImages;
//tab标题
@property (strong, nonatomic) NSMutableArray * tabTitles;
//修改的路径
@property (strong, nonatomic) NSString *updateUrl;

@end

static ZWMainTabBarVC *theFxUIMainVC = nil;
@implementation ZWMainTabBarVC
//单例模式
+ (instancetype)sharedInstance {
    @synchronized(self){
        if(theFxUIMainVC == nil){
            theFxUIMainVC = [[ZWMainTabBarVC alloc] init];
        }
    }
    return theFxUIMainVC;
}
//损毁
+ (void)destory{
    if(theFxUIMainVC){
        theFxUIMainVC = nil;
    }
}

//init properties
//tab文字信息
-(NSMutableArray *)tabTitles{
    if(!_tabTitles){
        _tabTitles = [[NSMutableArray alloc] init];
        [_tabTitles addObject:@"首页"];
        [_tabTitles addObject:@"第二个"];
        [_tabTitles addObject:@"第三个"];
        [_tabTitles addObject:@"第四个"];
    }
    return _tabTitles;
}
//正常情况下Item图片
-(NSMutableArray *)normalImages{
    if(!_normalImages){
        _normalImages  = [[NSMutableArray alloc]init];
        [_normalImages addObject:@"tab_home_up"];
        [_normalImages addObject:@"tab_two_up"];
        [_normalImages addObject:@"tab_three_up"];
        [_normalImages addObject:@"tab_four_up"];
    }
    return _normalImages;
}
//按下后图片列表
-(NSMutableArray *)pressedImages{
    if(!_pressedImages){
        _pressedImages = [[NSMutableArray alloc] init];
        [_pressedImages addObject:@"tab_home_down"];
        [_pressedImages addObject:@"tab_two_down"];
        [_pressedImages addObject:@"tab_three_down"];
        [_pressedImages addObject:@"tab_four_down"];
    }
    return _pressedImages;
}

//获取tabbar基本属性
-(NSMutableArray *)getTabBarInfo{
    
    UITabBar *tabBar = self.tabBar;
    CGRect rect = tabBar.frame;
    self.tabBarHeight = rect.size.height;
    
    CGFloat itemWidth = rect.size.width / [self.normalImages count];
    CGFloat imageWidth = 25.0f;
    CGFloat imageHeight = 25.0f;
    
    NSMutableArray* tabBarInfos  =  [[NSMutableArray alloc] init];
    TabBarInfo* homeTabBarInfo = [[TabBarInfo alloc] initWithData:self.normalImages[MAIN_VIEW_HOME]
                                                    backImageName:nil
                                                      titleOfItem:self.tabTitles[MAIN_VIEW_HOME]
                                                      widthOfItem:itemWidth
                                                 imageWidthOfItem:imageWidth
                                                imageHeightOfItem:imageHeight
                                                       showOfItem:YES];
    
    TabBarInfo* twoTabBarInfo = [[TabBarInfo alloc] initWithData:self.normalImages[MAIN_VIEW_TWO]
                                                       backImageName:nil
                                                         titleOfItem:self.tabTitles[MAIN_VIEW_TWO]
                                                         widthOfItem:itemWidth
                                                    imageWidthOfItem:imageWidth
                                                   imageHeightOfItem:imageHeight
                                                          showOfItem:YES];
    
    TabBarInfo* threeTabBarInfo = [[TabBarInfo alloc] initWithData:self.normalImages[MAIN_VIEW_THREE]
                                                        backImageName:nil
                                                          titleOfItem:self.tabTitles[MAIN_VIEW_THREE]
                                                          widthOfItem:itemWidth
                                                     imageWidthOfItem:imageWidth
                                                    imageHeightOfItem:imageHeight
                                                           showOfItem:YES];
    
    TabBarInfo* fourTabBarInfo  =  [[TabBarInfo alloc] initWithData:self.pressedImages[MAIN_VIEW_FOUR]
                                                      backImageName:nil
                                                        titleOfItem:self.tabTitles[MAIN_VIEW_FOUR]
                                                        widthOfItem:itemWidth
                                                   imageWidthOfItem:imageWidth
                                                  imageHeightOfItem:imageHeight
                                                         showOfItem:YES];
    //预先构建指定个数的数组
    for(int i = 0;i<[self.normalImages count];i++){
        [tabBarInfos addObject:@"0"];
    }
    
    //分配info至指定位置
    [tabBarInfos setObject:homeTabBarInfo atIndexedSubscript:MAIN_VIEW_HOME];
    [tabBarInfos setObject:twoTabBarInfo atIndexedSubscript:MAIN_VIEW_TWO];
    [tabBarInfos setObject:threeTabBarInfo atIndexedSubscript:MAIN_VIEW_THREE];
    [tabBarInfos setObject:fourTabBarInfo atIndexedSubscript:MAIN_VIEW_FOUR];
    return tabBarInfos;
}



//为tabbarcontroller 添加view
-(void)setViews{
    ZWHomeViewController * homeVC = [[ZWHomeViewController alloc]init];
    UINavigationController * homeNaviVC = [[UINavigationController alloc]initWithRootViewController:homeVC];

    ZWTwoViewController * twoVC = [[ZWTwoViewController alloc] init];
    UINavigationController * twoNaviVC = [[UINavigationController alloc] initWithRootViewController:twoVC];
    
    ZWThreeViewController * threeVC = [[ZWThreeViewController alloc] init];
    UINavigationController * threeNaviVC = [[UINavigationController alloc]initWithRootViewController:threeVC];
    
    ZWFourViewController * fourVC = [[ZWFourViewController alloc] init];
    UINavigationController * fourNaviVC = [[UINavigationController alloc] initWithRootViewController:fourVC];
    
    //创建一个包含n个导航器的数组
    NSMutableArray * controllers = [NSMutableArray arrayWithCapacity:self.normalImages.count];
    //预先构建指定个数的数组
    for(int i = 0;i<[self.normalImages count];i++){
        [controllers addObject:@"0"];
    }
    [controllers setObject:homeNaviVC atIndexedSubscript:MAIN_VIEW_HOME];
    [controllers setObject:twoNaviVC atIndexedSubscript:MAIN_VIEW_TWO];
    [controllers setObject:threeNaviVC atIndexedSubscript:MAIN_VIEW_THREE];
    [controllers setObject:fourNaviVC atIndexedSubscript:MAIN_VIEW_FOUR];
    //为tabbarcontroller赋值
    self.viewControllers = controllers;
}

//生成tabbar
-(ZWTabBar *)createTabBar{
    //添加view
    ZWTabBar * glTabBar  =  [[ZWTabBar alloc] initWithFrame:self.tabBar.frame arrayOfTabBarInfo:[self getTabBarInfo] delegate:self];
    [glTabBar setBackgroundImage:[UIImage imageNamed:@"tab_bg"]];
    
    glTabBar.userInteractionEnabled  =  YES;
    //添加动作
    UITapGestureRecognizer*tapGesture  =  [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickHomeItem)];
    [glTabBar addGestureRecognizer:tapGesture objectAtIndex:MAIN_VIEW_HOME];
    
    UITapGestureRecognizer*tapGestureMsg  =  [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickTwoItem)];
    [glTabBar addGestureRecognizer:tapGestureMsg objectAtIndex:MAIN_VIEW_TWO];
    
    UITapGestureRecognizer*tapGestureHome  =  [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickThreeItem)];
    [glTabBar addGestureRecognizer:tapGestureHome objectAtIndex:MAIN_VIEW_THREE];
    
    UITapGestureRecognizer*tapGestureContact  =  [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickFourItem)];
    [glTabBar addGestureRecognizer:tapGestureContact objectAtIndex:MAIN_VIEW_FOUR];
    
    
    [self setViews];
    return glTabBar;
}


- (void)viewDidLoad{
    [super viewDidLoad];
    
    _selectColor = [UIColor blueColor];

    
    [self.tabBar removeFromSuperview];
    //创建普通按钮
    if(!_ZWTabBar){
        _ZWTabBar = [self createTabBar];
    }
    _ZWTabBar.tag  =  0;
    [self.view addSubview:_ZWTabBar];
    
    [self clickHomeItem];
    
}


-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
//设置活跃的标记
-(void) setActiveAtIndex:(NSInteger)index{
    if(index == MAIN_VIEW_HOME){
        [_ZWTabBar setItemImage:[UIImage imageNamed:self.pressedImages[MAIN_VIEW_HOME]] objectAtIndex:MAIN_VIEW_HOME];
    }else{
        [_ZWTabBar setItemImage:[UIImage imageNamed:self.normalImages[MAIN_VIEW_HOME]] objectAtIndex:MAIN_VIEW_HOME];
    }
    
 
    if(index == MAIN_VIEW_TWO){
        [_ZWTabBar setItemImage:[UIImage imageNamed:self.pressedImages[MAIN_VIEW_TWO]] objectAtIndex:MAIN_VIEW_TWO];
    }else{
        [_ZWTabBar setItemImage:[UIImage imageNamed:self.normalImages[MAIN_VIEW_TWO]] objectAtIndex:MAIN_VIEW_TWO];
    }
    
    
    if(index == MAIN_VIEW_THREE){
        [_ZWTabBar setItemImage:[UIImage imageNamed:self.pressedImages[MAIN_VIEW_THREE]] objectAtIndex:MAIN_VIEW_THREE];
    }else{
        [_ZWTabBar setItemImage:[UIImage imageNamed:self.normalImages[MAIN_VIEW_THREE]] objectAtIndex:MAIN_VIEW_THREE];
    }
    

    if(index == MAIN_VIEW_FOUR){
        [_ZWTabBar setItemImage:[UIImage imageNamed:self.pressedImages[MAIN_VIEW_FOUR]] objectAtIndex:MAIN_VIEW_FOUR];
    }else{
        [_ZWTabBar setItemImage:[UIImage imageNamed:self.normalImages[MAIN_VIEW_FOUR]] objectAtIndex:MAIN_VIEW_FOUR];
    }
    
    //改变字体颜色
    [_ZWTabBar setTitleColorForAll:[UIColor blackColor]];
    [_ZWTabBar setTitleColor:_selectColor objectAtIndex:index];
    //切换选择view
    self.selectedIndex  =  index;
}

-(void)clickHomeItem{
     [self setActiveAtIndex:MAIN_VIEW_HOME];
}
- (void)clickTwoItem{
    [self setActiveAtIndex:MAIN_VIEW_TWO];
}

- (void)clickThreeItem{
    [self setActiveAtIndex:MAIN_VIEW_THREE];
}

- (void)clickFourItem{
    [self setActiveAtIndex:MAIN_VIEW_FOUR];
}







/**
 
 */
- (void)hideTabBar{
    _ZWTabBar.hidden = YES;
}
- (void)showTabBar{
    _ZWTabBar.hidden = NO;
}
@end
