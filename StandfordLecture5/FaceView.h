//
//  FaceView.h
//  StandfordLecture5
//
//  Created by Ed van Beinum on 16/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FaceView;

@protocol FaceViewDataSource
- (float)smileForFaceView:(FaceView *)sender;
@end

@interface FaceView : UIView

@property (nonatomic) CGFloat scale;

- (void)pinch:(UIPinchGestureRecognizer *)gesture;

@property (nonatomic, weak) IBOutlet id <FaceViewDataSource> dataSource;

@end
