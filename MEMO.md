## やりたい事（終わった物は取り消し線）
-   ~Flutter空のプロジェクト生成~
-   ~追加画面作成~
-   ~画面遷移~
-   ~ナビゲーション機能を実装~
-   ~日付処理~
-   ~ボタン機能~
-   ~ウェブサイトをそのまま表示してみる~
-   ~envファイルでの環境変数管理~
-   API連携
-   データ編集
-   エラーハンドリング
-   画面を複数のコンポーネントで組み合わせる
-   ログ機能を実装
-   モバイル専用機能を使ってみる

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
