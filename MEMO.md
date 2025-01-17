## 開発環境
-   OS : Bootcampを利用したWindows 10
    -   macOSのバージョンが古くXcode15がインストール出来なかったため。。。
-   テスト環境 : Androidの実機、Chromeブラウザー
-   コードエディター：VSCode
-   ソースコード管理 : github

## やりたい事（終わった物は取り消し線）
-   ~Flutter空のプロジェクト生成~ : [commit](https://github.com/will-of-work-80/flutter-test/commit/d668c1f8598405ab00453dd5fc91475b37dc150e)
-   ~追加画面作成~ : [commit](https://github.com/will-of-work-80/flutter-test/commit/a8a71f9bf84a77255572125cadcea9f7f88aca13)
-   ~画面遷移~ : [commit](https://github.com/will-of-work-80/flutter-test/commit/a8a71f9bf84a77255572125cadcea9f7f88aca13)
-   ~ナビゲーション機能を実装~ : [commit](https://github.com/will-of-work-80/flutter-test/commit/d9b7396dd025a4b4c6f60529e5370fccf68c2d64), [共通化commit](https://github.com/will-of-work-80/flutter-test/commit/bd7cfda3a087135a064c0ee95a93b863a4e92ecc)
-   ~日付処理~ : [commit](https://github.com/will-of-work-80/flutter-test/commit/e030cb0e22615fde5bee367a50cd2fb2dbbcecb8)
-   ~ボタン機能~
-   ~ウェブサイトをそのまま表示してみる~ : [commit](https://github.com/will-of-work-80/flutter-test/commit/74f4fc630dcd92e943c93bdac663ae913ca893a0)
-   ~envファイルでの環境変数管理~ : [commit](https://github.com/will-of-work-80/flutter-test/commit/e8f141e82a8c79e3fa9f71d1d5b73909590b9ff2)
-   ~ダイアログを表示~ : [commit](https://github.com/will-of-work-80/flutter-test/commit/e54c82f5629f1bfa1ae46114fc8ead61460cf4de)
-   API連携
-   データ編集
-   エラーハンドリング
-   画面を複数のコンポーネントで組み合わせる
-   ログ機能を実装
-   モバイル専用機能を使ってみる
-   ~画像表示~ : [commit](https://github.com/will-of-work-80/flutter-test/commit/48453636703d9f1d5912f0b09fb5e4dc57c32258)
    -   こちらを参考
        -   [画像をバックグラウンドに表示する](https://zenn.dev/captain_blue/articles/flutter-background-image)
-   カルーセル機能実装
-   テストツールを導入する
-   足し算アプリを作成する
    -   ~低学年向け足し算アプリ~

## 勉強予定
-   FlutterにもHooksがあるので調べる
-   RiverPodを調べる
-   HooksとRiverPod使い分け？組み合わせを調査
    -   こちらを参考
        -   [Hooksについて](https://riverpod.dev/ja/docs/concepts/about_hooks)

## API連携
-   openweatherAPIとの連携
    -   無料の天気情報を取得できるAPI
    -   データ取得部分はほとんど[open_weather_example_flutter](https://github.com/bizz84/open_weather_example_flutter)のコードを利用した。
    -   こちらを参考
        -   [Open Weather MapのAPI取得方法](https://auto-worker.com/blog/?p=1612)

-   Gemini生成AIとの連携
-   Google APIを利用してみる(calender, Google map ... etc)
    -   こちらを参考予定
        -   [Google Maps Demo](https://github.com/flutter/samples/tree/main/google_maps)
        -   [GoogleMap for Flutter あれこれ](https://zenn.dev/slowhand/articles/f4e4e092f9b72b)

## 足し算アプリを作成する
-   ~画面上入力ボタンを作成~ : [commit](https://github.com/will-of-work-80/flutter-test/commit/e54c82f5629f1bfa1ae46114fc8ead61460cf4de)
-   足し算の式を生成する
-   一桁の足し算で結果は二桁まで
-   当たったら`正解`間違ったら`不正解`文字をだす

## 低学年向け足し算アプリ
-   ~入力ボタンを作成して配置~ : [commit](https://github.com/will-of-work-80/flutter-test/commit/9cbef0b620a630d489f38d7349a9f8e82d10f6c6)
    -   こちらを参考
        -   [計算機アプリを依頼したら凄かった](https://qiita.com/YokohamaHori/items/575b7fcd675db2ca31af)
-   ~ランダム関数を利用して式を作成する~ : [commit](https://github.com/will-of-work-80/flutter-test/commit/8d4aea719e7085e9fabcb39dd7eeeb25b8f6453d)
-   ~計算式をレベル3に分ける~ : [commit](https://github.com/will-of-work-80/flutter-test/commit/f8845eeaf2e67ddb82ec2a563c3556a5f320359f)
-   ~状態バーを追加~ : [commit](https://github.com/will-of-work-80/flutter-test/commit/06fb5d6095832ae05d46b7a7642b717b7987b2e7)
-   StateProviderは利用しないでローカル変数のみでの対応
-   画面遷移してもレベル情報は保持できるようにする : [commit](https://github.com/will-of-work-80/flutter-test/commit/a7a880e90124b6020e33399230398206c0919872)


## スタイル関連
-   display: flexみたいなものがあるのか　-> 存在する(`Spacer(flex: 2)`)
    -   一つのラインで両端にアイテムを設置したい
-   文字列関連デザインを確認
    -   こちらを参考
        -   [Spacerウィジェットの紹介](https://www.kamo-it.org/blog/flutter-spacer/)
        -   [Text widgets](https://docs.flutter.dev/ui/widgets/text)
-   アイテムが画面を超える時にスクロールが可能にする
    -   こちらを参考
        -   [Columnで画面範囲を超えてしまったときの解決方法](https://flutterlabo.tech/note/na448cb31dd3a)
-   ~ボタンを画面の一番下に表示したい~ : [commit](https://github.com/will-of-work-80/flutter-test/commit/e54c82f5629f1bfa1ae46114fc8ead61460cf4de)

## ナビゲーション機能
-   Drawerを利用して画面ページを移動できるナビゲーション機能を実装
-   ナビゲーション機能を共通関数にする
-   こちらを参考
    -   [AppBarをコンポーネント化して全画面に同じデザインを反映させる](https://zenn.dev/lisras/articles/bdd4a43ce16cfc)
    -   [標準的で使いやすいサイドメニューを簡単に実装する Drawer](https://flutter.keicode.com/basics/drawer.php#google_vignette)

## モバイル専用機能を使ってみる
-   gradleのバージョンアップが必要だった
    -   android/settings.gradle : 8.1.0 -> 8.2.1
-   こちらを参考
    -   [webview_flutter を使ってアプリ内にサイトを実装する](https://zenn.dev/koichi_51/articles/5a233d200b0d02)
    -   [webview_flutter 4.10.0](https://pub.dev/packages/webview_flutter)

## Widgetの理解
-   StatefulWidgetとStatelessWidget
    -   こちらを参考
        -   [StatefulWidgetとStatelessWidgetの違い](https://stv-tech.co.jp/blog/statefulwidget%E3%81%A8statelesswidget%E3%81%AE%E9%81%95%E3%81%84)
-   ConsumerWidgetとConsumerStatefulWidget概念を理解しよう
    -   こちらを参考
        -   [riverpod 公式ドキュメントまとめ](https://qiita.com/GonpapaN/items/851a66d1a271d97ddf77)

## riverpodの色々
-   `ConsumerWidget`と`Consumer`の使用例 : [commit](https://github.com/will-of-work-80/flutter-test/commit/f895b23d0c20b39c8b6fe3316be8f2a0ca586118)
-   こちらを参考
       -   [StateProviderの使い方｜サンプルを用いて解説](https://terupro.net/flutter-counter-app/)

## トラブルシューティング
-   画像がCORS違反でローカルのブラウザー環境で表示されない時の対処法
    -   開発環境でのみ有効な対処らしいが、今回はこれで問題なし
        -   flutter\bin\cacheのflutter_tools.stampを消す（cors...に名称変更）
        -   flutter\packages\flutter_tools\lib\src\webのchrome.dartを変更する
            `disable-extensions`の下に`disable-web-security`を追加する。
    -   こちらを参考
        -   [CORS policyを解決する3つの方法](https://flutter.salon/flutterweb/cors/)
-   riverpod を使ったときに Bad state: No ProviderScope foundエラーが出る
    -   ProviderScope widget で wrap する必要がある : [commit](https://github.com/will-of-work-80/flutter-test/commit/f895b23d0c20b39c8b6fe3316be8f2a0ca586118)
