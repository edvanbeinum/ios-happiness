//
//  HappinessViewController.m
//  StandfordLecture5
//
//  Created by Ed van Beinum on 16/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HappinessViewController.h"
#import "FaceView.h"

@interface HappinessViewController()
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
}
@end
