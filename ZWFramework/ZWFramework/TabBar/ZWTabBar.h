//
//  ZWTabBar.h
//  ZWArchitecture
//
//  Created by joon on 2017/3/2.
//  Copyright © 2017年 joon. All rights reserved.
//

//  项目tabbar声明定义
#import <UIKit/UIKit.h>

@protocol ZWTabBarDelegate;

@interface TabBarInfo : NSObject{
    
}
//判断是否为按钮
@property (nonatomic) BOOL isButton;
//按钮
@property (nonatomic,strong) UIButton * button;
//图片名
@property (nonatomic, retain) NSString* imageName;
//背景图片名
@property (nonatomic, strong) NSString* backImageName;
//标题
@property (nonatomic, retain) NSString* title;
//item宽
@property CGFloat itemWidth;
//图片宽
@property CGFloat imageWidth;
//图片高
@property CGFloat imageHeight;
//是否显示标题
@property BOOL isShowTitle;
//初始化方法
-(id) init;
//带参初始化
-(id) initWithData:(NSString*) name backImageName:(NSString*)backImageName titleOfItem:(NSString*)title widthOfItem:(CGFloat)itemWidth imageWidthOfItem:(CGFloat) imageWidth imageHeightOfItem:(CGFloat) imageHeigth showOfItem:(BOOL)flag;
//初始化
-(instancetype) initWithButton:(UIButton *)button widthOfItem:(CGFloat)itemWidth showofItem:(BOOL)flag;
@end



@interface ZWTabBar : UIView{
    id<ZWTabBarDelegate> _delegate;
}

@property (nonatomic, retain) NSMutableArray* items;

@property (nonatomic, retain) id delegate;

- (id)initWithFrame:(CGRect)frame arrayOfTabBarInfo:(NSMutableArray*) tabBarInfos delegate:(id)delegate;
- (void)setItemImage:(UIImage*) image objectAtIndex:(NSInteger) index;
- (void)addGestureRecognizer:(UITapGestureRecognizer*)gestureRecognizer objectAtIndex:(NSInteger)index;
- (void)setTitleColorForAll:(UIColor*)color;
- (void)setTitleColor:(UIColor*)color objectAtIndex:(NSInteger)index;
- (void)setBackgroundImage:(UIImage*)image;
- (void)clearTip:(NSInteger)index;
- (void)setTip:(NSInteger)num objectAtIndex:(NSInteger)index;
- (void)setBackImageView:(NSString*)imageName objectAtIndex:(NSInteger)index;
@end


@protocol ZWTabBarDelegate <NSObject>

@optional
- (void)ZWTabBar:(ZWTabBar*)tabBar didSetItemImage:(NSInteger)index;
- (void)ZWTabBar:(ZWTabBar*)tabBar didFinishSetItem:(NSInteger)index;
@end
