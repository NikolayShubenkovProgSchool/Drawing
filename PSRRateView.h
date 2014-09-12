//
//  PSRRateView.h
//  Drawing
//
//  Created by n.shubenkov on 12/09/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSRRateView : UIView
@property (nonatomic) float rating;
@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic) NSNumber *lineWidth;
@end
