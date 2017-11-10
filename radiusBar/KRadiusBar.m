//
//  KRadiusBar.m
//  KRadiusBarChart
//
//  Created by tenghu on 2017/11/10.
//  Copyright © 2017年 tenghu. All rights reserved.
//

#import "KRadiusBar.h"


static CABasicAnimation* fadeAnimation(){
    CABasicAnimation* fadeAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    fadeAnimation.toValue = [NSNumber numberWithFloat:1.0];
    fadeAnimation.duration = 2.0;
    return fadeAnimation;
}


@interface KRadiusBar ()

@property (nonatomic, strong)CAShapeLayer *barLayer; //柱状层
@property (nonatomic, strong)UIBezierPath *barPath; //柱状赛贝尔路径
@property (nonatomic, strong)CATextLayer *textLayer; //数值文字显示层

@end


@implementation KRadiusBar

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        
        _barLayer = [CAShapeLayer new];
        [self.layer addSublayer:_barLayer];
        _barLayer.frame = self.bounds;
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    _textLayer.position = CGPointMake(self.bounds.size.width/2 ,self.bounds.size.height*(1-_barProgress)-9);
    
    CABasicAnimation *fade = fadeAnimation();
    [self.textLayer addAnimation:fade forKey:nil];
    
    //    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    //    pathAnimation.duration = 1.0;
    //    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //    pathAnimation.fromValue = @0.0f;
    //    pathAnimation.toValue = @1.0f;
    //    [_barLayer addAnimation:pathAnimation forKey:nil];
    
    
}

// 设置百分百（显示动画）
- (void)setProgress{
    
    if (_barProgress == 0.0) {
        return;
    }
    CGRect rect = CGRectMake(self.bounds.origin.x, (self.bounds.size.height)*(1-_barProgress), 38, (self.bounds.size.height)*(_barProgress));
    _barPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(3, 3)];
    
    _barLayer.path = _barPath.CGPath;
}

//设置柱子进度
- (void)setBarProgress:(float)progress{
    _barProgress = progress;
    [self setProgress];
}
//设置柱子颜色
- (void)setBarColor:(UIColor *)barColor{
    _barLayer.strokeColor = barColor.CGColor;
    _barLayer.fillColor = barColor.CGColor;
}

//设置数值
- (void)setBarText:(NSString*)text{
    self.textLayer.string = text;
}

- (CATextLayer *)textLayer{
    if (!_textLayer) {
        _textLayer = [CATextLayer layer];
        UIColor * color = [UIColor cyanColor];
        _textLayer.foregroundColor = color.CGColor;
        _textLayer.fontSize = 9;
        _textLayer.alignmentMode = kCAAlignmentCenter;
        _textLayer.contentsScale = [[UIScreen mainScreen] scale];
        CGRect bounds = _barLayer.bounds;
        bounds.size.height = 9;
        _textLayer.bounds = bounds;
        [self.layer addSublayer:_textLayer];
        
    }
    return _textLayer;
}

-(void)dealloc{
    
    _barLayer = nil; //柱状层
    _barPath = nil; //柱状赛贝尔路径
    _textLayer = nil; //数值文字显示层
    
}


@end
