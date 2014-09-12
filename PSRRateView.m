//
//  PSRRateView.m
//  Drawing
//
//  Created by n.shubenkov on 12/09/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import "PSRRateView.h"

@implementation PSRRateView

- (void)setRating:(float)rating
{
    if (_rating != rating){
        _rating = rating;
        // ни к воем случае не вызывайте этот метод привинтивно
//        [self draw Rect:self.bound];
        // используйте вот это:
        [self setNeedsDisplay];
    }
}


#pragma mark - Setup

- (void)awakeFromNib
{
    [self setup];
}

- (void)setup
{
    self.lineColor = [UIColor redColor];
}

#pragma mark - Drawing

- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIBezierPath *circle = [UIBezierPath bezierPathWithOvalInRect:rect];
    circle.lineWidth = [self.lineWidth floatValue];
    

    [self.lineColor setStroke];
    [circle stroke];
    
}

@end
