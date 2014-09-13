//
//  ViewController.m
//  Drawing
//
//  Created by n.shubenkov on 12/09/14.
//  Copyright (c) 2014 n.shubenkov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) CGFloat scale;
@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc]initWithTarget:self
                                                                                 action:@selector(gesturePinched:)];
    [self.movingResisingView addGestureRecognizer:pinchGesture];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(gestureMoved:)];
    [self.movingResisingView addGestureRecognizer:pan];
    
}

- (void)gestureMoved:(UIPanGestureRecognizer *)panGesture
{
    switch (panGesture.state) {
            //for gesture begining reset translation
        case UIGestureRecognizerStateBegan:
            [panGesture setTranslation:CGPointZero
                                inView:self.movingResisingView];
            break;
            //for changed or finished gesture
            //move view to this translation and reset translation
            //as we calculated it
        case UIGestureRecognizerStateChanged:
        case UIGestureRecognizerStateEnded:{
            
            CGPoint translation = [panGesture translationInView:self.movingResisingView];
            CGRect movingViewFrame = self.movingResisingView.frame;
            movingViewFrame.origin.x += translation.x;
            movingViewFrame.origin.y += translation.y;
            self.movingResisingView.frame = movingViewFrame;
            
            [panGesture setTranslation:CGPointZero
                                inView:self.movingResisingView];
        }
            
        default:
            //do nothing
            break;
    }
}

- (void)gesturePinched:(UIPinchGestureRecognizer *)pinchGesture
{
    if (pinchGesture.state == UIGestureRecognizerStateChanged){
        CGAffineTransform transform = self.movingResisingView.transform;
        transform = CGAffineTransformScale(transform, pinchGesture.scale, pinchGesture.scale);
        self.movingResisingView.transform = transform;
        pinchGesture.scale = 1;
    }
}

@end
