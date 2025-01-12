import 'package:flutter/material.dart';
import 'package:flutter_application_test/navigation.dart';

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('スクロールテスト'),
        ),
        drawer: NavigationComponentWidget(),
        // ListView の代わりこちらを使うとアイテムが画面を超えないはColumnと同じ挙動をする
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(height: 100, color: Colors.red),
              Container(height: 100, color: Colors.orange),
              Container(height: 100, color: Colors.yellow),
              Container(height: 100, color: Colors.green),
              Container(height: 100, color: Colors.teal),
              Container(height: 100, color: Colors.blue),
              Container(height: 100, color: Colors.deepPurple),
              Container(height: 100, color: Colors.red),
              Container(height: 100, color: Colors.orange),
              Container(height: 100, color: Colors.yellow),
              Container(height: 100, color: Colors.green),
              Container(height: 100, color: Colors.teal),
              Container(height: 100, color: Colors.blue),
              Container(height: 100, color: Colors.deepPurple),
            ],
          ),
        ));
  }
}
