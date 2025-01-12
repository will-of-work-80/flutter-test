import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application_test/navigation.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      // 初めて開くページを設定
      ..loadRequest(Uri.parse('https://www.google.com/'))
      // JavaScriptモードを設定
      // disabledを設定するとJavaScriptの実行が制限される
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      // Webサイトの背景色を指定
      ..setBackgroundColor(Colors.black)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // ローディング中の処理の実装ができる箇所
            log('progress: $progress');
          },
          onPageStarted: (String url) {
            // ページ読み込み時の処理の実装ができる箇所
            log('page started: $url');
          },
          onPageFinished: (String url) {
            // 読み込み完了時の処理の実装ができる箇所
            log('page finished: $url');
          },
          onWebResourceError: (WebResourceError error) {
            // ページの読み込み失敗の時処理を実装できる箇所
            log('error: $error');
          },
          // ページのURLが https://www.youtube.com/ から始まる場合は NavigationDecision.preventにする
          // このようにすることで、以下の動画のように YouTube に遷移しなくなる
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );
    return Scaffold(
      appBar: AppBar(
        title: Text('ウェブブラウザーとして画面を表示'),
      ),
      drawer: NavigationComponentWidget(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: WebViewWidget(
                controller: controller,
              ),
            ),
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  // 戻るボタンの表示
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {
                        controller.goBack();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                      ),
                    ),
                  ),
                  // 進むボタンの表示
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {
                        controller.goForward();
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                      ),
                    ),
                  ),
                  // リロードボタンの表示
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {
                        controller.reload();
                      },
                      icon: const Icon(
                        Icons.replay,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
