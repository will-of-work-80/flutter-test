import 'package:flutter/material.dart';
import 'package:flutter_application_test/navigation.dart';
import 'package:flutter_application_test/scroll_test.dart';

class StyleTestPage extends StatelessWidget {
  StyleTestPage({super.key});

  final con = Container(
    color: Colors.black,
    width: 10,
    height: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('スタイルを色々テストする'),
        ),
        drawer: NavigationComponentWidget(),
        body: Container(
          height: double.infinity,
          color: Colors.lightBlue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 文字スタイル関連
              // https://docs.flutter.dev/ui/widgets/text
              Text('普通文字',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  )),
              Container(
                // 横幅をいっぱい使う
                width: double.infinity,
                child: Text('太文字',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Text('スタイル色々',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                  )),
              Text('スタイル色々',
                  style: TextStyle(
                    fontSize: 20,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 3
                      ..color = Color(0xFF0000FF),
                  )),
              // 文字列の中に強調したい文字がある時などに使う
              RichText(
                  text: TextSpan(
                text: 'Hello',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                children: [
                  TextSpan(
                      text: 'bold',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'world!'),
                ],
              )),
              // この中の全てのテキストが同じスタイルを反映できる
              DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.purple,
                  ),
                  child: Column(
                    children: [
                      Text('アイテム1'),
                      Text('アイテム2'),
                      Text('アイテム3'),
                    ],
                  )),
              Container(
                  color: Colors.amber,
                  width: 100,
                  height: 40,
                  child: Center(child: con)),
              // アイテムの間に余白をあけたい時
              SizedBox(height: 20),
              Container(
                  color: Colors.amber,
                  width: 100,
                  height: 40,
                  alignment: Alignment.bottomCenter,
                  child: con),
              SizedBox(height: 20),
              // アイテムの配置を調整できる
              Row(
                children: [
                  colorSquare(Colors.green),
                  Spacer(flex: 2),
                  colorSquare(Colors.yellow),
                  Spacer(flex: 1),
                  colorSquare(Colors.pink),
                  SizedBox(width: 20),
                  colorSquare(Colors.cyan),
                ],
              ),
              Center(
                child: ElevatedButton(
                  child: Text('スクロールテスト画面'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScrollViewTestPage()));
                  },
                ),
              ),
            ],
          ),
        ));
  }

  Widget colorSquare(Color color) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(),
      ),
    );
  }
}
