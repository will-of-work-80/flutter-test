import 'package:flutter/material.dart';
import 'package:flutter_application_test/main.dart';
import 'package:flutter_application_test/web_view.dart';
import 'package:flutter_application_test/style_test.dart';
import 'package:flutter_application_test/scroll_test.dart';
import 'package:flutter_application_test/weather.dart';
import 'package:flutter_application_test/state_provider_test.dart';

class NavigationComponentWidget extends StatelessWidget {
  const NavigationComponentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 100,
            child: DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('images/gara.jpg'),
                fit: BoxFit.cover,
                // 透明度を追加
                opacity: 0.4,
              )),
              child: Text(
                '機能一覧',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          navigationItem(
            context,
            'メイン画面',
            MyApp(),
          ),
          navigationItem(
            context,
            'Open Weather APIテスト画面を表示',
            WeatherTestPage(),
          ),
          navigationItem(
            context,
            'ウェブブラウザーとして画面を表示',
            WebviewTestPage(),
          ),
          navigationItem(
            context,
            'スタイルを色々テストする',
            StyleTestPage(),
          ),
          navigationItem(
            context,
            'スクロールテスト',
            ScrollViewTestPage(),
          ),
          navigationItem(
            context,
            'StateProviderテスト(Plus)',
            StateProviderTestPage(),
          ),
          navigationItem(
            context,
            'StateProviderテスト(Minus)',
            StateProviderTestPage2(),
          ),
        ],
      ),
    );
  }
}

Widget navigationItem(BuildContext context, String title, Widget function) {
  return ListTile(
    title: Text(title),
    onTap: () {
      Navigator.push(
        context,
        // ProviderScope widget で wrapする
        // Bad state: No ProviderScope foundエラーが出るため
        MaterialPageRoute(
          builder: (context) => function,
        ),
      );
    },
  );
}
