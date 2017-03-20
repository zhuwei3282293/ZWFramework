//
//  ZWTabBar.m
//  ZWArchitecture
//
//  Created by joon on 2017/3/2.
//  Copyright © 2017年 joon. All rights reserved.
//

#import "ZWTabBar.h"
#import "ZWTabBarItem.h"

@implementation TabBarInfo
//初始化
-(id) init{
    self  =  [super init];
    return self;
}

//初始化
-(id) initWithData:(NSString *)name backImageName:(NSString*)backImageName titleOfItem:(NSString *)title widthOfItem:(CGFloat)itemWidth imageWidthOfItem:(CGFloat) imageWidth imageHeightOfItem:(CGFloat) imageHeigth showOfItem:(BOOL)flag{
    self  =  [super init];
    self.imageName  =  name;
    self.backImageName  =  backImageName;
    self.title  =  title;
    self.imageWidth  =  imageWidth;
    self.imageHeight  =  imageHeigth;
    self.isShowTitle  =  flag;
    self.itemWidth  =  itemWidth;
    self.isButton = NO;
    return self;
}
//初始化
-(instancetype) initWithButton:(UIButton *)button widthOfItem:(CGFloat)itemWidth showofItem:(BOOL)flag{
    self  =  [super init];
    if(self){
        self.button = button;
        self.isShowTitle  =  flag;
        self.itemWidth  =  itemWidth;
        self.isButton = YES;
    }
    return self;
}

@end

@implementation ZWTabBar

@synthesize delegate  =  _delegate;

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
//初始化
-(id)init{
    self  =  [super init];
    return self;
}
//初始化frame
-(id) initWithFrame:(CGRect)frame{
    self  =  [super initWithFrame:frame];
    return self;
}
//初始化frame
-(id) initWithFrame:(CGRect)frame arrayOfTabBarInfo:(NSMutableArray *)tabBarInfos delegate:(id)delegate{
    
    self  =  [super initWithFrame:frame];
    self.delegate  =  delegate;
    
    self.items  =  [[NSMutableArray alloc] init];

    
    CGFloat itemHeight  =  frame.size.height;
    
    CGFloat buttonViewX  =  0;
    //循环生成tabbarinfo
    for (NSInteger i  =  0; i < [tabBarInfos count]; i++) {
        TabBarInfo* info  =  [tabBarInfos objectAtIndex:i];
        CGFloat width  =  info.itemWidth;
        
        CGRect rect  =  CGRectMake(buttonViewX, 0, width, itemHeight);
        ZWTabBarItem* tabBarItem  = nil;
        if (info.isButton) {
            tabBarItem = [[ZWTabBarItem alloc] initWithButton:info.button frame:rect];
        }else{
            tabBarItem = [[ZWTabBarItem alloc] initWithFrame:rect title:info.title isShowTitle:info.isShowTitle imageName:info.imageName imageWidth:info.imageWidth imageHeight:info.imageHeight backImageName:info.backImageName];
        }
        
        tabBarItem.tag  =  i;
        [self.items addObject:tabBarItem];
        [self addSubview:tabBarItem];
        
        if([_delegate respondsToSelector:@selector(ZWTabBar:didFinishSetItem:)]){
            [_delegate ZWTabBar:self didFinishSetItem:i];
        }
        buttonViewX +=  width;
    }
    
    return self;
}

-(void) addGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer objectAtIndex:(NSInteger)index{
    UIView* view  =  [self.items objectAtIndex:index];
    [view addGestureRecognizer:gestureRecognizer];
    
}
//给每个item添加图片
-(void) setItemImage:(UIImage *)image objectAtIndex:(NSInteger) index{
    ZWTabBarItem* item  =  [self.items objectAtIndex:index];
    if(!item.isButton){
        [item setImage:image];
        
        if([_delegate respondsToSelector:@selector(ZWTabBar:didSetItemImage:)]){
            [_delegate ZWTabBar:self didSetItemImage:index];
        }
    }
}
//给item设置颜色
-(void) setTitleColorForAll:(UIColor *)color{
    
    for(NSInteger index  =  0 ; index < [self.items count]; index++){
        ZWTabBarItem* item  =  [self.items objectAtIndex:index];
        if(item&&!item.isButton){
            [item setTitleColor:color];
        }
    }
}
//给item设置标题颜色
-(void) setTitleColor:(UIColor *)color objectAtIndex:(NSInteger)index{
    ZWTabBarItem* item  =  [self.items objectAtIndex:index];
    if(item&&!item.isButton){
        [item setTitleColor:color];
    }
}
//设置背景图片
-(void) setBackgroundImage:(UIImage *)image{
    UIImageView* backImageView  =  [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    image  =  [image stretchableImageWithLeftCapWidth:floorf(image.size.width/2) topCapHeight:floorf(image.size.height/2)];
    backImageView.image  =  image;
    [self addSubview:backImageView];
    for (NSInteger i  =  0; i<[self.items count]; i++) {
        UIView* view  =  [self.items objectAtIndex:i];
        [view setBackgroundColor:[UIColor clearColor]];
        [self bringSubviewToFront:view];
    }
}
//清空提示
- (void)clearTip:(NSInteger)index{
    ZWTabBarItem* item  =  [self.items objectAtIndex:index];
    if(item){
        [item clearTip];
    }
}
//设置提示
- (void)setTip:(NSInteger)num objectAtIndex:(NSInteger)index{
    ZWTabBarItem* item  =  [self.items objectAtIndex:index];
    if(item){
        [item setTip:num];
    }
}
//设置背景图片
- (void)setBackImageView:(NSString *)imageName objectAtIndex:(NSInteger)index{
    
    if(imageName && ![imageName isEqualToString:@""]){
        UIImage* backImage  =  [UIImage imageNamed:imageName];
        backImage  =  [backImage stretchableImageWithLeftCapWidth:floorf(backImage.size.width / 2.0f) topCapHeight:floorf(backImage.size.height / 2.0f)];
        UIImageView* backImageView  =  [[UIImageView alloc] initWithImage:backImage];
        
        ZWTabBarItem* item  =  [self.items objectAtIndex:index];
        backImageView.frame  =  CGRectMake(0, 0, item.frame.size.width, item.frame.size.height);
        if(item&&!item.isButton){
            [item addSubview:backImageView];
            [item sendSubviewToBack:backImageView];
        }
    }
}
@end

