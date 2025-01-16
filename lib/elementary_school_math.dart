import 'package:flutter/material.dart';
import 'package:flutter_application_test/navigation.dart';

class ElementarySchoolMath extends StatefulWidget {
  const ElementarySchoolMath({super.key});

  @override
  State<ElementarySchoolMath> createState() => _ElementarySchoolMathState();
}

class _ElementarySchoolMathState extends State<ElementarySchoolMath> {
  // 足し算の結果入力用
  String inputStr = '';

  @override
  Widget build(BuildContext context) {
    Widget numberButton(String title) {
      return Expanded(
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            padding: EdgeInsets.all(16),
          ),
          onPressed: () {
            setState(() {
              if (inputStr == '') {
                inputStr = title;
              } else {
                inputStr = inputStr + title;
              }
            });
          },
          child: Text(title, style: TextStyle(fontSize: 24)),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('低学年向け足し算アプリ'),
      ),
      drawer: NavigationComponentWidget(),
      body: Column(
        // 画面の一番下に表示するため、指定
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: Text(inputStr,
                style: const TextStyle(
                    fontSize: 30, color: Colors.lightBlueAccent)),
          ),
          for (final row in [
            ['1', '2', '3', '4', '5'],
            ['6', '7', '8', '9', '0'],
          ])
            Row(
              children: row.map((btn) => numberButton(btn)).toList(),
            ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.amber[900],
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  onPressed: () {
                    showDialog<void>(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: Text('まだ機能未実装',
                                style: TextStyle(
                                  fontSize: 20,
                                )),
                          );
                        });
                  },
                  child: Text('入力', style: TextStyle(fontSize: 24)),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.amber[500],
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      inputStr = '';
                    });
                  },
                  child: Text('削除', style: TextStyle(fontSize: 24)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
