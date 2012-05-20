//
//  HappinessViewController.m
//  StandfordLecture5
//
//  Created by Ed van Beinum on 16/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HappinessViewController.h"
#import "FaceView.h"

@interface HappinessViewController() <FaceViewDataSource> // declared private api
@property (nonatomic, weak) IBOutlet FaceView *faceView;
@end

@implementation HappinessViewController

@synthesize happiness = _happiness;
@synthesize faceView = _faceView;

- (void) setHappiness:(int)happiness
{
    _happiness = happiness;
    [self.faceView setNeedsDisplay];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

- (void)setFaceView:(FaceView *)faceView
{
    _faceView = faceView;
    [self.faceView addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:self.faceView action:@selector(pinch:)]];
    [self.faceView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleHappinessGesture:)]];

    self.faceView.dataSource = self;
}

- (void)handleHappinessGesture:(UIPanGestureRecognizer *)gesture
{
    if ((gesture.state == UIGestureRecognizerStateChanged) ||
        (gesture.state == UIGestureRecognizerStateEnded)) {
        CGPoint translation = [gesture translationInView:self.faceView];
        self.happiness -= translation.y / 2;
        [gesture setTranslation:CGPointZero inView:self.faceView];
    }
}

- (float)smileForFaceView:(FaceView *)sender
{
    // hapiness is measured 0 100 but the smile curve is measured -1 to 1
    return (self.happiness - 50) / 50.0;
}
@end
