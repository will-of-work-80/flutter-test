import 'package:flutter/material.dart';
import 'package:flutter_application_test/navigation.dart';
import 'package:flutter_application_test/third.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('二つ目の画面'),
        ),
        drawer: NavigationComponentWidget(),
        body: Container(
          height: double.infinity,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton(
                  child: Text('スタイルを色々テストする'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ThirdPage()));
                  },
                ),
              ),
              // Center(
              //   child: ElevatedButton(
              //     child: Text('戻る'),
              //     onPressed: () {
              //       Navigator.pop(context);
              //     },
              //   ),
              // ),
            ],
          ),
        ));
  }
}
