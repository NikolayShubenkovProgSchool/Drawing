//
//  PSRRateView.m
//  Drawing
//
//  Created by n.shubenkov on 12/09/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import "PSRRateView.h"

//#import "UIView+PSRDrawHelpers.h"

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
    [self drawRatingInRect:rect];
    
    UIBezierPath *roundRectangle = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:CGRectGetWidth(rect) / 20];
    
    
    [[UIColor greenColor] setStroke];
    
    roundRectangle.lineWidth = 3;
    [roundRectangle moveToPoint:CGPointMake(20, 100)];
    [roundRectangle addLineToPoint:CGPointMake(60, 150)];
    

    
    [roundRectangle addArcWithCenter:CGPointMake(40, 50)
                              radius:80
                          startAngle:0
                            endAngle:M_PI
                           clockwise:YES];
    
    [[UIColor blackColor] setFill];
    
    [roundRectangle stroke];
//    [roundRectangle fill];
    
    
    
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
    [self.circleColor setStroke];
    [[UIColor orangeColor] setFill];
    
    [circle stroke];
    [circle fill];

}

@end
