//
//  CYXCameraShadowView.m
//  CYXCamera
//
//  Created by 超级腕电商 on 2019/2/17.
//  Copyright © 2019年 超级腕电商. All rights reserved.
//

#import "CYXCameraShadowView.h"
@interface CYXCameraShadowView ()
/*蒙版*/
@property (nonatomic,strong) UIView *maskView;
/*框*/
@property (nonatomic,strong) CAShapeLayer *shapeLayer;

@end

@implementation CYXCameraShadowView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.maskView.frame = self.bounds;
        [self addSubview:self.shadowIamgeView];
        [self addSubview:self.maskView];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.kMarginX = 47;
    self.kMarginY = 109;
    CGFloat rectangleWidth = self.frame.size.width-self.kMarginX*2;
    CGFloat rectangleHeight = self.frame.size.height-self.kMarginY*2;
    if ((rectangleWidth/rectangleHeight)>(5/8.0)) {
        rectangleHeight = rectangleWidth*8.0/5;
        self.kMarginY = (self.frame.size.height-rectangleHeight)/2.0;
    }else{
        rectangleWidth = rectangleHeight*5.0/8;
        self.kMarginX = (self.frame.size.width-rectangleWidth)/2.0;
    }
    //绘制一个遮罩
    //贝塞尔曲线 画一个带有圆角的矩形
    UIBezierPath *bpath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) cornerRadius:0];
    //贝塞尔曲线 画一个矩形
    [bpath appendPath:[[UIBezierPath bezierPathWithRoundedRect:CGRectMake(self.kMarginX, self.kMarginY, self.frame.size.width-self.kMarginX*2, self.frame.size.height - self.kMarginY * 2) cornerRadius:0] bezierPathByReversingPath]];
    self.shapeLayer.path = bpath.CGPath;
    //添加图层蒙板
    self.maskView.layer.mask = self.shapeLayer;
    self.shadowIamgeView.frame = CGRectMake(self.kMarginX, self.kMarginY, self.frame.size.width-self.kMarginX*2, self.frame.size.height - self.kMarginY * 2);
}
#pragma mark ---G
-(UIView*)maskView{
    if(!_maskView){
        _maskView = [[UIView alloc] init];
        _maskView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    }
    return _maskView;
}
-(CAShapeLayer*)shapeLayer{
    if(!_shapeLayer){
        _shapeLayer = [CAShapeLayer layer];
    }
    return _shapeLayer;
}
-(UIImageView*)shadowIamgeView{
    if(!_shadowIamgeView){
        _shadowIamgeView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cardShadowFront"]];
    }
    return _shadowIamgeView;
}
@end
