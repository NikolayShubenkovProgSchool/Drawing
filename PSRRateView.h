//
//  PSRRateView.h
//  Drawing
//
//  Created by n.shubenkov on 12/09/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface PSRRateView : UIView

@property (nonatomic)  IBInspectable CGFloat lineWidth;
//0 - 100
@property (nonatomic) IBInspectable CGFloat rating;
@property (nonatomic) IBInspectable UIColor *circleColor;


@end
