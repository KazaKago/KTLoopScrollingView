KTLoopScrollingView
===================

iOS上で電光掲示板風に文章が横に流れるViewを簡単に実現するライブラリです。  
登録した文章を順番にViewの中で流し、  
最後まで流しきった後は再び先頭のViewを流します。  

基本的にUIViewを継承したViewであれば何でも流すことが可能です。  
流す向きは上下左右に設定することができ、Viewが動く速度の変更や間隔の調整、  
アニメーションの遅延実行などをサポートしています。

![alt text](http://placehold.it/320x568)

##インストール##

###CocoaPods###

Podfile内に以下の一文を追記してpod installを行って下さい。

    pod 'KTLoopScrollingView', :git => 'https://github.com/weathercock/KTLoopScrollingView.git'

###マニュアル###

ライブラリ内のKTLoopScrollingViewフォルダごとXcodeのプロジェクトに取り込んで下さい。

##使い方##

    #import "KTLoopScrollingView.h"

使用するクラスで上記をインポートした後、
以下のように記載して下さい。

    //KTLoopScrollingViewの生成
    KTLoopScrollingView slidingView = [[KTLoopScrollingView alloc] init];
    slidingView.direction = KTAnimationDirectionFromLeftToRight; //流す方向
    slidingView.speed = 100.0; //スピードの調整
    slidingView.delay = 0.0; //遅延実行
    slidingView.space = 30.0; //流すView同士の間隔調整
    [self.view addSubview:slidingView];

    //流すViewの作成
    UILabel *slidingLabel = [[UILabel alloc] init];
    slidingLabel.font = [UIFont systemFontOfSize:30];
    slidingLabel.textColor = [UIColor blackColor];
    slidingLabel.alpha = 0.5;
    slidingLabel.text = @"This label is scrolling!";
    [slidingLabel sizeToFit];
    [slidingView.viewArray addObject:slidingLabel]; //KTLoopScrollingViewに登録

    //アニメーションを開始
    [slidingView startAnimation];

実行すると以下のようになります。

![alt text](http://placehold.it/320x200)

ViewArrayへ追加するものはUIViewであれば何でも良いので適宜書き換えて使用して下さい。  

アニメーションを停止させるには以下のようにします。

    [slidingView stopAnimation];

アニメーションが動作中か否かを確認する際は以下のようにします。

    [slidingView isAnimation];

##Tips##

KTLoopScrollingViewをを使用する際にCGAffineTransformMakeRotationを用いてViewを傾けると  
流れる座標がずれることがあるのでshiftInitPositionメソッドで座標を調整して下さい。

    slidingView.shiftInitPosition = CGPointMake(0, -90);

上記は元々流れる座標からy座標に-90だけずれた位置にViewが流れます。
またこのメソッドはKTAnimationDirectionが水平方向の際はxは座標は無視され、
KTAnimationDirectionが垂直方向の際はy座標は無視されます。

##ライセンス##

本ライブラリはMIT Licenseで配布しております。  
詳しくは付属のLICENSEファイルを御覧ください。
