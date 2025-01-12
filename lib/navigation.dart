import 'package:flutter/material.dart';
import 'package:flutter_application_test/main.dart';
import 'package:flutter_application_test/webView.dart';
import 'package:flutter_application_test/styleTest.dart';
import 'package:flutter_application_test/fourth.dart';

class NavigationComponentWidget extends StatelessWidget {
  const NavigationComponentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.lightBlue,
            ),
            child: Text(
              '機能一覧',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
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
                  builder: (context) => FourthPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
