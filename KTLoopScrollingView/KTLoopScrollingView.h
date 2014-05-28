//
//  KTLoopScrollingView.h
//  KTLoopScrollingView
//
//  Created by Kazamidori on 2014/05/24.
//  Copyright (c) 2014 Kazamidori. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KTLoopScrollingView : UIView

typedef NS_OPTIONS(NSUInteger, AnimationDirection) {
    KTAnimationDirectionFromLeftToRight = 0,
    KTAnimationDirectionFromRightToLeft,
    KTAnimationDirectionFromTopToBottom,
    KTAnimationDirectionFromBottomToTop,
};

@property (nonatomic, strong) NSMutableArray *viewArray;
@property (nonatomic, assign) float speed;
@property (nonatomic, assign) float space;
@property (nonatomic, assign) float delay;
@property (nonatomic, assign) AnimationDirection direction;
@property (nonatomic, assign) UIViewAnimationOptions option;
@property (nonatomic, assign) CGPoint shiftInitPosition;
@property (nonatomic, assign) CGPoint shiftEndPosition;

@property (nonatomic, readonly) BOOL isAnimationActive;

- (void)startAnimation;
- (void)stopAnimation;
- (BOOL)isAnimationActive;

@end
