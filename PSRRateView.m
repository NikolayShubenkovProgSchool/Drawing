//
//  PSRRateView.m
//  Drawing
//
//  Created by n.shubenkov on 12/09/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import "PSRRateView.h"

#import "UIView+PSRDrawHelpers.h"

CGFloat PSRDegreesToRadians(CGFloat degrees);

@implementation PSRRateView

- (void)setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}

- (void)setup
{
    self.circleColor = [UIColor yellowColor];
    self.lineWidth   = 4;
    self.rating      = 80;
}

- (void)awakeFromNib
{
    [self setup];
}

- (void)drawRect:(CGRect)rect
{
    
    [self drawGradient:rect];
    
    [self drawCircleGradientInRect:rect];
    
    [[UIColor redColor] setStroke];
    
    [self drawRatingInRect:rect];
    
        [self psr_pushContext];
    
        [[UIColor greenColor] setStroke];
        [self drawRoundRectInRect:rect];
    
        [self psr_popContext];
    
    [self drawTriangle];
    
    
}

- (void)drawCircleGradientInRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGGradientRef gradient;
    CGColorSpaceRef colorspace;
    CGFloat locations[3] = { 0.0, 0.5, 1.0 };
    
    NSArray *colors = @[(id)[UIColor redColor].CGColor,
                        (id)[UIColor yellowColor].CGColor,
                        (id)[UIColor cyanColor].CGColor];
    
    colorspace = CGColorSpaceCreateDeviceRGB();
    
    gradient = CGGradientCreateWithColors(colorspace,
                                          (CFArrayRef)colors,
                                          locations);
    
    CGPoint startPoint, endPoint;
    CGFloat startRadius, endRadius;
    
    startPoint.x = 100;
    startPoint.y = 100;
    endPoint.x = 100;
    endPoint.y = 100;
    startRadius = 0;
    endRadius = 75;
    
    CGContextDrawRadialGradient(context, gradient, startPoint,
                                startRadius, endPoint, endRadius, 0);
}

- (void)drawGradient:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGGradientRef gradient;
    CGColorSpaceRef colorSpace;
    CGFloat locations[] = {0.25, 0.33,0.666,0.7};
    NSArray *colors = @[(id)[UIColor redColor].CGColor,
                        (id)[UIColor magentaColor].CGColor,
                        (id)[UIColor cyanColor].CGColor,
                        (id)[UIColor colorWithRed:0 green:1 blue:85/255.0 alpha:1].CGColor];
    //4 цвета
    //red bllue brown orange
    colorSpace = CGColorSpaceCreateDeviceRGB();
    gradient = CGGradientCreateWithColors(colorSpace,
                                          (CFArrayRef)colors,
                                          locations);
    
    CGPoint startPoint  = CGPointMake(CGRectGetMaxX(rect),CGRectGetMinY(rect));
    
    CGPoint finishPoint = CGPointMake(CGRectGetMinX(rect), CGRectGetMaxY(rect));
    
    CGContextDrawLinearGradient(context,
                                gradient,
                                startPoint,
                                finishPoint,
                                0);

}

- (void)drawRoundRectInRect:(CGRect)rect
{
    UIBezierPath *roundRectangle = [UIBezierPath bezierPathWithRoundedRect:rect
                                                              cornerRadius:CGRectGetWidth(rect) / 10];
    
    
    roundRectangle.lineWidth = 3;
    [roundRectangle moveToPoint:CGPointMake(20, 100)];
    [roundRectangle addLineToPoint:CGPointMake(60, 150)];
    
    
    
    [roundRectangle addArcWithCenter:CGPointMake(40, 50)
                              radius:80
                          startAngle:0
                            endAngle:M_PI
                           clockwise:YES];
    
    [roundRectangle stroke];

}

- (void)drawTriangle
{
    UIBezierPath *lines = [UIBezierPath bezierPath];
    lines.lineWidth = 15;
    [lines moveToPoint:CGPointMake(100, 100)];
    [lines addLineToPoint:CGPointMake(200, 100)];
    [lines addLineToPoint:CGPointMake(150, 200)];
    [lines closePath];
    
    [lines stroke];
}

- (void)drawRatingInRect:(CGRect)rect
{
    CGPoint center = CGPointMake(CGRectGetMidX(rect),CGRectGetMidY(rect));
    
    UIBezierPath *circle = [UIBezierPath bezierPathWithOvalInRect:rect];
    
    
    circle = [UIBezierPath bezierPathWithArcCenter:center
                                            radius:CGRectGetWidth(rect) / 2 - self.lineWidth / 2
                                        startAngle:-M_PI/2
                                          endAngle:-M_PI/2 + 2 * M_PI * (self.rating) / 100
                                         clockwise:YES];
    
    circle.lineWidth = self.lineWidth;
    
    [circle stroke];
    [circle fill];

}

@end
