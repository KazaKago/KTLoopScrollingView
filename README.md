KTLoopScrollingView
===================

iOS上で電光掲示板風に文章が横に流れるViewを簡単に実現するライブラリです。  
登録した文章を順番にViewの中で流し、  
最後まで流しきった後は再び先頭のViewを流します。  

基本的にUIViewを継承したViewであれば何でも流すことが可能です。  
流す向きは上下左右に設定することができ、Viewが動く速度の変更や間隔の調整、  
アニメーションの遅延実行などをサポートしています。

![スクリーンショット](Screenshot01.gif)

##インストール##

###CocoaPods###

Podfile内に以下の一文を追記してpod installを行って下さい。

```
pod 'KTLoopScrollingView', :git => 'https://github.com/weathercock/KTLoopScrollingView.git'
```

###マニュアル###

ライブラリ内のKTLoopScrollingViewフォルダごとXcodeのプロジェクトに取り込んで下さい。

##使い方##

```objc
#import "KTLoopScrollingView.h"
```

使用するクラスで上記をインポートした後、
以下のように記載して下さい。

```objc
//KTLoopScrollingViewの生成
KTLoopScrollingView slidingView = [[KTLoopScrollingView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
slidingView.direction = KTAnimationDirectionFromLeftToRight; //左から右へ流す(デフォルト=KTAnimationDirectionFromLeftToRight)
slidingView.speed = 100.0; //スピードの調整(デフォルト=60.0f)
slidingView.delay = 0.0; //遅延実行(デフォルト=0.0f)
slidingView.space = 30.0; //流すView同士の間隔調整(デフォルト=20.0f)
slidingView.option = UIViewAnimationOptionCurveLinear; //UIViewAnimationOption(デフォルト=UIViewAnimationOptionCurveLinear)
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
```

ViewArrayへ追加するものはUIViewであれば何でも良いので適宜書き換えて使用して下さい。  

アニメーションを停止させるには以下のようにします。

```objc
[slidingView stopAnimation];
```

アニメーションが動作中か否かを確認する際は以下のようにします。

```objc
BOOL isAnimationActive = [slidingView isAnimationActive];
```
##Tips##

KTLoopScrollingViewをを使用する際にCGAffineTransformMakeRotationを用いてViewを回転させると  
流れる座標がずれることがあるのでその場合にはshiftInitPositionメソッドを用いて座標を調整して下さい。

```objc
slidingView.shiftInitPosition = CGPointMake(0, -90);
```

上記の処理を追加すると流れ始める座標がy座標に-90だけずれた位置になります。  
このメソッドはKTAnimationDirectionが水平方向の際はxは座標は無視され、垂直方向の際はy座標は無視されます。

##ライセンス##

本ライブラリはMIT Licenseで配布しております。  
詳しくは付属のLICENSEファイルを御覧ください。
