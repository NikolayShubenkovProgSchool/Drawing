//
//  UIView+PSRDrawHelpers.m
//  Drawing
//
//  Created by n.shubenkov on 12/09/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import "UIView+PSRDrawHelpers.h"

@implementation UIView (PSRDrawHelpers)


- (void)psr_pushContextAndRotateUpsideDown
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, self.bounds.size.width, self.bounds.size.height);
    CGContextRotateCTM(context, M_PI);
}

- (void)psr_popContext
{
    CGContextRestoreGState(UIGraphicsGetCurrentContext());
}


@end