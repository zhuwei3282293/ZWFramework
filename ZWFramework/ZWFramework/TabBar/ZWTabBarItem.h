//
//  ZWTabBarItem.h
//  ZWArchitecture
//
//  Created by joon on 2017/3/2.
//  Copyright © 2017年 joon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWTabBarItem : UIView{
    //是否显示标题
    BOOL _isShowTitle;
}
//是否为按钮
@property (nonatomic) BOOL isButton;
//按钮
@property (nonatomic,strong) UIButton * button;
//图片视图
@property (nonatomic, retain) UIImageView* imageView;
//提示视图
@property (nonatomic, retain) UIImageView* tipView;
//标题文本
@property (nonatomic, retain) UILabel* titleLabel;
//背景图片
@property (nonatomic, strong) UIImageView* backImageView;
//初始化带参
- (id)initWithFrame:(CGRect)frame title:(NSString*)title isShowTitle:(BOOL)isShowTitle imageName:(NSString*)imageName imageWidth:(CGFloat)imageWidth imageHeight:(CGFloat)imageHeight backImageName:(NSString*)backImageName;
//初始化
-(instancetype)initWithButton:(UIButton *)button frame:(CGRect)frame;
//设置图片
- (void)setImage:(UIImage*)image;
//设置标题颜色
- (void)setTitleColor:(UIColor*)color;
//清空提示
- (void)clearTip;
//设置提示
- (void)setTip:(NSInteger)num;
@end
