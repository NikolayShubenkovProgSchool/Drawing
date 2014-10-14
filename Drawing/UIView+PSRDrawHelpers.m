//
//  UIView+PSRDrawHelpers.m
//  Drawing
//
//  Created by n.shubenkov on 12/09/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import "UIView+PSRDrawHelpers.h"

@implementation UIView (PSRDrawHelpers)


- (void)psr_pushContext
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
}

- (void)psr_flipContext
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, self.bounds.size.width, self.bounds.size.height);
    CGContextRotateCTM(context, M_PI);
}

- (void)psr_popContext
{
    CGContextRestoreGState(UIGraphicsGetCurrentContext());
}


@end
