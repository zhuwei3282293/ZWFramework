//
//  ZWTabBarItem.m
//  ZWArchitecture
//
//  Created by joon on 2017/3/2.
//  Copyright © 2017年 joon. All rights reserved.
//

//  设置tabbar中的item
#import "ZWTabBarItem.h"

@implementation ZWTabBarItem
//是否为按钮
-(BOOL)isButton{
    if(!_isButton){
        _isButton = NO;
    }
    return _isButton;
}
//按钮
-(UIButton *)button{
    if(!_button){
        _button = [[UIButton alloc] init];
    }
    return _button;
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
//初始化带参
- (id)initWithFrame:(CGRect)frame title:(NSString *)title isShowTitle:(BOOL)isShowTitle imageName:(NSString *)imageName imageWidth:(CGFloat)imageWidth imageHeight:(CGFloat)imageHeight backImageName:(NSString *)backImageName{
    self  =  [super initWithFrame:frame];
    
    _isShowTitle  =  isShowTitle;
    
    CGFloat itemWidth  =  frame.size.width;
    CGFloat itemHeight  =  frame.size.height;
    
    CGFloat vSpacing  =  8.0f;
    CGFloat hSpacing  =  5.0f;
    
    CGFloat imageViewWidth  =  30.0f;
    CGFloat imageViewHeight  =  28.0f;
    
    UIFont* font  =  [UIFont boldSystemFontOfSize:10];
    CGSize fontSize  =  CGSizeMake(0.0f, 0.0f);
    //判断是否显示标题
    //如果显示 则调整位置
    //不显示 位置不变
    if(isShowTitle){
        
        fontSize  =  [title sizeWithFont: font
                       constrainedToSize:CGSizeMake(itemWidth, itemHeight)
                           lineBreakMode:NSLineBreakByWordWrapping];
        
        imageViewHeight  =  itemHeight - fontSize.height - vSpacing;
        imageViewWidth  =  itemWidth - hSpacing;
    }
    else{
        imageViewHeight  =  itemHeight - vSpacing;
        imageViewWidth  =  itemWidth - hSpacing;
    }
    
    UIImage* image  =  [UIImage imageNamed:imageName];
    imageViewWidth  =  imageViewWidth > image.size.width ? image.size.width : imageViewWidth;
    imageViewHeight  =  imageViewHeight > image.size.height ? image.size.height : imageViewHeight;
    //imageViewWidth  =  MAX(imageViewWidth, info.imageWidth);
    //imageViewHeight  =  MAX(imageViewHeight, info.imageHeight);
    
    imageViewWidth  =  imageWidth;
    imageViewHeight  =  imageHeight;
    
    CGFloat imageViewX  =  (itemWidth - imageViewWidth) / 2.0f;
    CGFloat imageViewY  =  vSpacing;
    
    if(!isShowTitle){
        imageViewY  =  (itemHeight - imageViewHeight) / 2.0f;
    }
    
    self.imageView  =  [[UIImageView alloc] initWithFrame:CGRectMake(imageViewX, imageViewY, imageViewWidth, imageViewHeight)];
    self.imageView.image  =  image;
    
    [self addSubview:self.imageView];
    
    if(isShowTitle){
        CGFloat titleLabelX  =  (itemWidth - fontSize.width) / 2.0f;
        CGFloat titleLabelY  =  itemHeight - 6.0f - fontSize.height;
        
        self.titleLabel  =  [[UILabel alloc] initWithFrame:CGRectMake(titleLabelX, titleLabelY, fontSize.width, fontSize.height)];
        self.titleLabel.text  =  title;
        self.titleLabel.font  =  font;
        self.titleLabel.textColor  =  [UIColor blackColor];
        [self addSubview:self.titleLabel];
    }
    
    if(backImageName && ![backImageName isEqualToString:@""]){
        UIImage* backImage  =  [UIImage imageNamed:backImageName];
        backImage  =  [backImage stretchableImageWithLeftCapWidth:floorf(backImage.size.width / 2.0f) topCapHeight:floorf(backImage.size.height / 2.0f)];
        self.backImageView  =  [[UIImageView alloc] initWithImage:backImage];
        self.backImageView.frame  =  CGRectMake(0, 0, frame.size.width, frame.size.height);
        [self addSubview:self.backImageView];
        [self sendSubviewToBack:self.backImageView];
    }
    
    return self;
}
//设置图片
- (void)setImage:(UIImage *)image{
    self.imageView.image  =  image;
}
//设置标题颜色
- (void)setTitleColor:(UIColor *)color{
    self.titleLabel.textColor  =  color;
}
//设置提示
- (void)setTip:(NSInteger)num{
    if(self.tipView){
        [self.tipView removeFromSuperview];
    }
    //如果提示大于0
    //就显示一个红色圆球上面标注数字
    if(num > 0){
        CGFloat messageTipX  =  self.imageView.frame.origin.x + self.imageView.frame.size.width - 8;
        CGFloat messageTipY  =  2.0f;
        
        self.tipView  =  [[UIImageView alloc] initWithFrame:CGRectMake(messageTipX, messageTipY, 16, 16)];
        self.tipView.image  =  [UIImage imageNamed:@"message_tip"];
        
        UILabel* numLabel  =  [[UILabel alloc] initWithFrame:CGRectMake(2, 2, self.tipView.frame.size.width - 4, self.tipView.frame.size.height - 4)];
        //numLabel.backgroundColor  =  [UIColor redColor];
        numLabel.text  =  [NSString stringWithFormat:@"%ld", (long)num];
        numLabel.textColor  =  [UIColor whiteColor];
        numLabel.font  =  [UIFont systemFontOfSize:8.0f];
        numLabel.textAlignment  =  NSTextAlignmentCenter;
        [self.tipView addSubview:numLabel];
        
        [self addSubview:self.tipView];
        [self bringSubviewToFront:self.tipView];
    }
}
//清除提示
- (void)clearTip{
    if(self.tipView){
        [self.tipView removeFromSuperview];
    }
}
//初始化
-(instancetype) initWithButton:(UIButton *)button frame:(CGRect)frame{
    self = [self initWithFrame:frame];
    if (self) {
        self.isButton = YES;
        
        self.button = button;
        //使button在中间
        CGRect buttonFrame = self.button.frame;
        buttonFrame.origin.x = frame.size.width/2 - buttonFrame.size.width/2;
        buttonFrame.origin.y = frame.size.height/2 - buttonFrame.size.height/2;
        self.button.frame = buttonFrame;
        
        [self addSubview:self.button];
        [self bringSubviewToFront:self.button];
    }
    return self;
}

@end
