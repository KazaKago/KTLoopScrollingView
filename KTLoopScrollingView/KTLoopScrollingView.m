//
//  KTLoopScrollingView.m
//  KTLoopScrollingView
//
//  Created by Kazamidori on 2014/05/24.
//  Copyright (c) 2014 Kazamidori. All rights reserved.
//

#import "KTLoopScrollingView.h"

@interface KTLoopScrollingView ()

@property (nonatomic, strong) NSTimer *nextAnimTimer;
@property (nonatomic, readwrite) BOOL isAnimationActive;

@end

@implementation KTLoopScrollingView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self initAnimation];
        self.clipsToBounds = YES;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initAnimation];
        self.clipsToBounds = YES;
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

#pragma mark - Animation Method

- (void)initAnimation
{
    self.viewArray = [[NSMutableArray alloc] init];
    self.speed = 60.0f;
    self.space = 20.0f;
    self.delay = 0.0f;
    self.direction = KTAnimationDirectionFromLeftToRight;
    self.option = UIViewAnimationOptionCurveLinear;
    self.shiftInitPosition = CGPointMake(0, 0);
    self.shiftEndPosition = CGPointMake(0, 0);
    self.isAnimationActive = NO;
}

- (void)startAnimation
{
    if(!self.isAnimationActive){
        self.isAnimationActive = YES;
        [self oneAnimation:0];
    }
}

- (void)stopAnimation
{
    if(self.isAnimationActive){
        self.isAnimationActive = NO;
        [self.nextAnimTimer invalidate];
    }
}

- (void)oneAnimation:(int)index
{
    //set initial position
    UIView *targetView = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:self.viewArray[index]]];
    CGRect targetFrame = targetView.frame;
    if(self.direction == KTAnimationDirectionFromLeftToRight){
        targetFrame.origin.x = -targetFrame.size.width + self.shiftInitPosition.x;
        targetFrame.origin.y = (self.frame.size.height - targetView.frame.size.height) / 2 + self.shiftInitPosition.y;
    }else if(self.direction == KTAnimationDirectionFromRightToLeft){
        targetFrame.origin.x = self.frame.size.width + self.shiftInitPosition.x;
        targetFrame.origin.y = (self.frame.size.height - targetView.frame.size.height) / 2 + self.shiftInitPosition.y;
    }else if(self.direction == KTAnimationDirectionFromTopToBottom){
        targetFrame.origin.x = (self.frame.size.width - targetView.frame.size.width) / 2 + self.shiftInitPosition.x;
        targetFrame.origin.y = -targetFrame.size.height + self.shiftInitPosition.y;
    }else if(self.direction == KTAnimationDirectionFromBottomToTop){
        targetFrame.origin.x = (self.frame.size.width - targetView.frame.size.width) / 2 + self.shiftInitPosition.x;
        targetFrame.origin.y = self.frame.size.height + self.shiftInitPosition.y;
    }
    targetView.frame = targetFrame;
    targetView.clipsToBounds = YES;
    [self insertSubview:targetView atIndex:0];

    //calculate animation during
    float during;
    if(self.direction == KTAnimationDirectionFromLeftToRight || self.direction == KTAnimationDirectionFromRightToLeft){
        during = (self.frame.size.width + targetFrame.size.width) / self.speed;
    }else if(self.direction == KTAnimationDirectionFromTopToBottom || self.direction == KTAnimationDirectionFromBottomToTop){
        during = (self.frame.size.height + targetFrame.size.height) / self.speed;
    }else{
        during = 5;
    }

    //commit animation
    [UIView animateWithDuration:during
                          delay:self.delay
                        options:self.option
                     animations:^{
                         //caluculate potsition of animation end
                         if(self.direction == KTAnimationDirectionFromLeftToRight){
                             targetView.transform = CGAffineTransformMakeTranslation(self.frame.size.width + targetFrame.size.width + self.shiftEndPosition.x, 0 + self.shiftEndPosition.y);
                         }else if(self.direction == KTAnimationDirectionFromRightToLeft){
                             targetView.transform = CGAffineTransformMakeTranslation(-(self.frame.size.width + targetFrame.size.width) + self.shiftEndPosition.x, 0 + self.shiftEndPosition.y);
                         }else if(self.direction == KTAnimationDirectionFromTopToBottom){
                             targetView.transform = CGAffineTransformMakeTranslation(0 + self.shiftEndPosition.x, self.frame.size.height + targetFrame.size.height + self.shiftEndPosition.y);
                         }else if(self.direction == KTAnimationDirectionFromBottomToTop){
                             targetView.transform = CGAffineTransformMakeTranslation(0 + self.shiftEndPosition.x, -(self.frame.size.height + targetFrame.size.height) + self.shiftEndPosition.y);
                         }
                     }
                     completion:^(BOOL finished){
                         [targetView removeFromSuperview];
                     }];

    //set next animation
    int nextIndex = (index + 1) % self.viewArray.count;
    float nextTime;
    if(self.direction == KTAnimationDirectionFromLeftToRight || self.direction == KTAnimationDirectionFromRightToLeft){
        nextTime = (targetFrame.size.width + self.space) / self.speed;
    }else if(self.direction == KTAnimationDirectionFromTopToBottom || self.direction == KTAnimationDirectionFromBottomToTop){
        nextTime = (targetFrame.size.height + self.space) / self.speed;
    }else{
        nextTime = 5;
    }
    NSDictionary *userInfo = @{@"IndexKey" : @(nextIndex)};
    self.nextAnimTimer = [NSTimer scheduledTimerWithTimeInterval:nextTime
                                                          target:self
                                                        selector:@selector(repeatAnimation:)
                                                        userInfo:userInfo
                                                         repeats:NO];
}

- (void)repeatAnimation:(NSTimer *)timer
{
    NSDictionary *userInfo = [timer userInfo];
    int nextIndex = [userInfo[@"IndexKey"] intValue];
    [self oneAnimation:nextIndex];
}

@end
