import 'package:flutter/material.dart';
import 'package:flutter_application_test/navigation.dart';
import 'dart:math' as math;

final random = math.Random();

final infoDefault = '数字を入力してください。';
final maxProcessCount = 10;

class ElementarySchoolMath extends StatefulWidget {
  const ElementarySchoolMath({super.key});

  @override
  State<ElementarySchoolMath> createState() => _ElementarySchoolMathState();
}

class _ElementarySchoolMathState extends State<ElementarySchoolMath> {
  // 情報を表示
  String infoStr = infoDefault;
  // 足し算の結果入力用
  String inputStr = '';
  // 問題のアイテム１
  int firstNum = random.nextInt(10);
  // 問題のアイテム２
  int secondNum = random.nextInt(10);
  // 選択されたレベル
  int selectLevel = 1;
  // 足し算を行った数
  List<bool> processCountList = [];

  setLevel() {
    return selectLevel == 1
        ? random.nextInt(10)
        : selectLevel == 2
            ? random.nextInt(20)
            : random.nextInt(100);
  }

  Widget levelButton(int value) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor:
              value == selectLevel ? Colors.red[100] : Colors.grey[300],
          foregroundColor: value == selectLevel ? Colors.red : Colors.grey[500],
          padding: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        onPressed: () {
          setState(() {
            processCountList = [];
            selectLevel = value;
            firstNum = setLevel();
            secondNum = setLevel();
          });
        },
        child: Text('レベル$value', style: TextStyle(fontSize: 24)),
      ),
    );
  }

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

  Widget colorSquare(int rowNum) {
    var squareColor = Colors.grey[350];
    if (rowNum <= processCountList.length) {
      final resultBool = processCountList[rowNum - 1];
      squareColor = resultBool ? Colors.orange : Colors.grey[600];
    }

    return Expanded(
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          color: squareColor,
          border: Border.all(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('低学年向け足し算アプリ'),
      ),
      drawer: NavigationComponentWidget(),
      body: Column(
        // 画面の一番下に表示するため、指定
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // 画面の下に表示したくない物はこちらに指定
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    levelButton(1),
                    levelButton(2),
                    levelButton(3),
                  ],
                ),
                for (final processTotal in [
                  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                ])
                  Row(
                    children: processTotal
                        .map((rowNum) => colorSquare(rowNum))
                        .toList(),
                  ),
              ],
            ),
          ),
          SizedBox(height: 50),
          Center(
            child: Text(infoStr,
                style: const TextStyle(fontSize: 20, color: Colors.red)),
          ),
          SizedBox(height: 20),
          DefaultTextStyle(
            style: TextStyle(
              fontSize: 30,
              color: Colors.blue,
            ),
            child: Row(
              children: [
                Expanded(child: SizedBox()),
                Text('$firstNum'),
                SizedBox(width: 10),
                Text('+'),
                SizedBox(width: 10),
                Text('$secondNum'),
                SizedBox(width: 10),
                Text('='),
                Expanded(child: SizedBox()),
              ],
            ),
          ),
          SizedBox(height: 20),
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
                    setState(() {
                      final result = firstNum + secondNum;
                      if ('' == inputStr) {
                        infoStr = infoDefault;
                      } else if (result.toString() == inputStr) {
                        infoStr = '正解です。';
                        inputStr = '';
                        firstNum = setLevel();
                        secondNum = setLevel();
                        processCountList.add(true);
                      } else {
                        infoStr = '$inputStrではありません。';
                        inputStr = '';
                        firstNum = setLevel();
                        secondNum = setLevel();
                        processCountList.add(false);
                      }
                      if (processCountList.length == maxProcessCount) {
                        showDialog<void>(
                            context: context,
                            builder: (_) {
                              infoStr = infoDefault;
                              final trueCount = processCountList
                                  .where((item) => item == true)
                                  .length;
                              final falseCount = processCountList
                                  .where((item) => item == false)
                                  .length;
                              processCountList = [];
                              return AlertDialog(
                                title: Text(
                                    '終わりました！\n正解:$trueCount、はずれ:$falseCount',
                                    style: TextStyle(
                                      fontSize: 20,
                                    )),
                              );
                            });
                      }
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
