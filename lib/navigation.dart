import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
          ListTile(
            title: Text('メイン画面'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyApp(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Open Weather APIテスト画面を表示'),
            onTap: () {
              Navigator.push(
                context,
                // ProviderScope widget で wrapする
                // Bad state: No ProviderScope foundエラーが出るため
                MaterialPageRoute(
                  builder: (context) =>
                      const ProviderScope(child: WeatherTestPage()),
                ),
              );
            },
          ),
          ListTile(
            title: Text('ウェブブラウザーとして画面を表示'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebviewTestPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('スタイルを色々テストする'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StyleTestPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('スクロールテスト'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScrollViewTestPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('StateProviderテスト(Plus)'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StateProviderTestPage(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('StateProviderテスト(Minus)'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StateProviderTestPage2(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
