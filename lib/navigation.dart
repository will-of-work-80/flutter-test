import 'package:flutter/material.dart';
import 'package:flutter_application_test/main.dart';
import 'package:flutter_application_test/second.dart';
import 'package:flutter_application_test/third.dart';

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
            title: Text('二つ目の画面'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondPage(),
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
                  builder: (context) => ThirdPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
