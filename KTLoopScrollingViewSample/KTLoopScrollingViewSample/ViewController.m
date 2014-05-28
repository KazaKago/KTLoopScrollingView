//
//  ViewController.m
//  KTLoopScrollingViewSample
//
//  Created by Kazamidori on 2014/05/24.
//  Copyright (c) 2014年 Kazamidori. All rights reserved.
//

#import "ViewController.h"
#import "KTLoopScrollingView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet KTLoopScrollingView *loopScrollingView01;
@property (weak, nonatomic) IBOutlet KTLoopScrollingView *loopScrollingView02;
@property (weak, nonatomic) IBOutlet KTLoopScrollingView *loopScrollingView03;
@property (weak, nonatomic) IBOutlet KTLoopScrollingView *loopScrollingView04;

- (IBAction)startAnimBtnClicked:(id)sender;
- (IBAction)stopAnimBtnClicked:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    /* loopScrollingView01 */

    //初期値で動作(左から右へ、speed = 60, space = 20)


    /* loopScrollingView02 */

    //右から左へViewを流す
    self.loopScrollingView02.direction = KTAnimationDirectionFromRightToLeft;
    //スピードを設定
    self.loopScrollingView02.speed = 120.0;
    //流れるViewの間隔を設定
    self.loopScrollingView02.space = 40.0;
    //遅延実行させる
    self.loopScrollingView02.delay = 1.0;


    /* loopScrollingView03 */

    //下から上にViewを流す
    self.loopScrollingView03.direction = KTAnimationDirectionFromBottomToTop;


    /* loopScrollingView04 */

    //Viewを斜めにしてみる
    self.loopScrollingView04.transform = CGAffineTransformMakeRotation(M_PI * - 20 / 360);
    //Viewを斜めにするとながれるViewの座標がずれるのでshiftInitPositionを使って初期位置を調節する
    self.loopScrollingView04.shiftInitPosition = CGPointMake(0, -24);


    /* 流すViewを作成する（UIViewならなんでも可）*/

    UILabel *label01 = [[UILabel alloc] init];
    label01.font = [UIFont systemFontOfSize:12];
    label01.text = @"hoge";
    [label01 sizeToFit];
    [self.loopScrollingView01.viewArray addObject:label01];
    [self.loopScrollingView02.viewArray addObject:label01];
    [self.loopScrollingView03.viewArray addObject:label01];
    [self.loopScrollingView04.viewArray addObject:label01];

    UIView *barView01 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 3)];
    barView01.backgroundColor = [UIColor blueColor];
    [self.loopScrollingView01.viewArray addObject:barView01];
    [self.loopScrollingView02.viewArray addObject:barView01];
    [self.loopScrollingView03.viewArray addObject:barView01];
    [self.loopScrollingView04.viewArray addObject:barView01];

    UILabel *label02 = [[UILabel alloc] init];
    label02.font = [UIFont systemFontOfSize:16];
    label02.text = @"hogehogehoge";
    [label02 sizeToFit];
    [self.loopScrollingView01.viewArray addObject:label02];
    [self.loopScrollingView02.viewArray addObject:label02];
    [self.loopScrollingView03.viewArray addObject:label02];
    [self.loopScrollingView04.viewArray addObject:label02];

    UIView *barView02 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 3)];
    barView02.backgroundColor = [UIColor redColor];
    [self.loopScrollingView01.viewArray addObject:barView02];
    [self.loopScrollingView02.viewArray addObject:barView02];
    [self.loopScrollingView03.viewArray addObject:barView02];
    [self.loopScrollingView04.viewArray addObject:barView02];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startAnimBtnClicked:(id)sender
{
    [self.loopScrollingView01 startAnimation];
    [self.loopScrollingView02 startAnimation];
    [self.loopScrollingView03 startAnimation];
    [self.loopScrollingView04 startAnimation];
}

- (IBAction)stopAnimBtnClicked:(id)sender
{
    [self.loopScrollingView01 stopAnimation];
    [self.loopScrollingView02 stopAnimation];
    [self.loopScrollingView03 stopAnimation];
    [self.loopScrollingView04 stopAnimation];
}

@end
