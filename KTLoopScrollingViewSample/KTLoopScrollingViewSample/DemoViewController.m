//
//  DemoViewController.m
//  KTLoopScrollingViewSample
//
//  Created by Kensuke Tamura on 2014/06/13.
//  Copyright (c) 2014年 Kazamidori. All rights reserved.
//

#import "DemoViewController.h"
#import "KTLoopScrollingView.h"

@interface DemoViewController ()

@property (weak, nonatomic) IBOutlet KTLoopScrollingView *slidingView01;
@property (weak, nonatomic) IBOutlet KTLoopScrollingView *slidingView02;
@property (weak, nonatomic) IBOutlet KTLoopScrollingView *slidingView03;
@property (weak, nonatomic) IBOutlet KTLoopScrollingView *slidingView04;

@end

@implementation DemoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.slidingView01.transform = CGAffineTransformMakeRotation(M_PI * + 20 / 360);
    self.slidingView01.direction = KTAnimationDirectionFromRightToLeft;
    self.slidingView01.shiftInitPosition = CGPointMake(0, -34);
    self.slidingView01.speed = 200.0;
    self.slidingView01.delay = 0.0;
    self.slidingView01.space = 50.0;
    UILabel *slidingLabel01 = [[UILabel alloc] init];
    slidingLabel01.font = [UIFont systemFontOfSize:120];
    slidingLabel01.textColor = [UIColor whiteColor];
    slidingLabel01.text = @"This is a test message for KTLoopingSlidngView.";
    [slidingLabel01 sizeToFit];
    [self.slidingView01.viewArray addObject:slidingLabel01];

    self.slidingView02.transform = CGAffineTransformMakeRotation(M_PI * - 20 / 360);
    self.slidingView02.direction = KTAnimationDirectionFromLeftToRight;
    self.slidingView02.shiftInitPosition = CGPointMake(0, -28);
    self.slidingView02.speed = 300.0;
    self.slidingView02.delay = 1.0;
    self.slidingView02.space = 50.0;
    UILabel *slidingLabel02 = [[UILabel alloc] init];
    slidingLabel02.font = [UIFont systemFontOfSize:60];
    slidingLabel02.textColor = [UIColor colorWithRed:0.0f/255.0f green:185.0f/255.0f blue:161.0f/255.0f alpha:1.0f];
    slidingLabel02.alpha = 0.5;
    slidingLabel02.text = @"This is a test message for KTLoopingSlidngView.";
    [slidingLabel02 sizeToFit];
    [self.slidingView02.viewArray addObject:slidingLabel02];

    self.slidingView03.transform = CGAffineTransformMakeRotation(M_PI * + 100 / 360);
    self.slidingView03.direction = KTAnimationDirectionFromLeftToRight;
    self.slidingView03.shiftInitPosition = CGPointMake(0, -90);
    self.slidingView03.speed = 100.0;
    self.slidingView03.delay = 0.0;
    self.slidingView03.space = 30.0;
    UILabel *slidingLabel03 = [[UILabel alloc] init];
    slidingLabel03.font = [UIFont systemFontOfSize:30];
    slidingLabel03.textColor = [UIColor colorWithRed:243.0f/255.0f green:133.0f/255.0f blue:168.0f/255.0f alpha:1.0f];
    slidingLabel03.alpha = 0.5;
    slidingLabel03.text = @"This is a test message for KTLoopingSlidngView.";
    [slidingLabel03 sizeToFit];
    [self.slidingView03.viewArray addObject:slidingLabel03];

    self.slidingView04.transform = CGAffineTransformMakeRotation(M_PI * + -80 / 360);
    self.slidingView04.direction = KTAnimationDirectionFromLeftToRight;
    self.slidingView04.shiftInitPosition = CGPointMake(0, -160);
    self.slidingView04.speed = 80.0;
    self.slidingView04.delay = 0.0;
    self.slidingView04.space = 30.0;
    UILabel *slidingLabel04 = [[UILabel alloc] init];
    slidingLabel04.font = [UIFont systemFontOfSize:130];
    slidingLabel04.textColor = [UIColor colorWithRed:255.0f/255.0f green:159.0f/255.0f blue:59.0f/255.0f alpha:1.0f];
    slidingLabel04.alpha = 0.5;
    slidingLabel04.text = @"This is a test message for KTLoopingSlidngView.";
    [slidingLabel04 sizeToFit];
    [self.slidingView04.viewArray addObject:slidingLabel04];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self.slidingView01 startAnimation];
    [self.slidingView02 startAnimation];
    [self.slidingView03 startAnimation];
    [self.slidingView04 startAnimation];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
