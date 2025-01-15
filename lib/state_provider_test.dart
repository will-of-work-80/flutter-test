import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_test/navigation.dart';

final numberStrDefault = "数字を入力して";

final countProvider = StateProvider<int>((ref) {
  return 0;
});

final strProvider = StateProvider<String>((ref) {
  return numberStrDefault;
});

// ConsumerWidget
// StatelessWidgetなWidgetでプロバイダーを使いたい場合に使用。
// Consumerでラップせずに使うとWidget全体が再ビルドの対象になる点に注意する
class StateProviderTestPage extends ConsumerWidget {
  const StateProviderTestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 状態管理している値を取得する
    final countState = ref.watch(countProvider);
    final strState = ref.watch(strProvider);

    // 状態管理している値を操作できるようにする
    final countNotifier = ref.watch(countProvider.notifier);
    final strNotifier = ref.watch(strProvider.notifier);
    // 画面の横幅を取得する
    final viewWidthSize = MediaQuery.of(context).size;
    // ボタンの横幅
    final numberButtonWidthSize = viewWidthSize.width * 0.2;

    return Scaffold(
      appBar: AppBar(
        title: Text('StateProviderテスト(Plus)'),
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
                Center(
                  child: Text('$countState',
                      style: const TextStyle(
                          fontSize: 30, color: Colors.lightBlueAccent)),
                ),
                Center(
                  child: ElevatedButton(
                    child: Text('Plus'),
                    onPressed: () {
                      countNotifier.state++;
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(strState,
                style: const TextStyle(
                    fontSize: 30, color: Colors.lightBlueAccent)),
          ),
          SizedBox(
            height: 50,
            child: Row(
              children: [
                numberButton(context, numberButtonWidthSize, '1', strNotifier),
                numberButton(context, numberButtonWidthSize, '2', strNotifier),
                numberButton(context, numberButtonWidthSize, '3', strNotifier),
                numberButton(context, numberButtonWidthSize, '4', strNotifier),
                numberButton(context, numberButtonWidthSize, '5', strNotifier),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: Row(
              children: [
                numberButton(context, numberButtonWidthSize, '6', strNotifier),
                numberButton(context, numberButtonWidthSize, '7', strNotifier),
                numberButton(context, numberButtonWidthSize, '8', strNotifier),
                numberButton(context, numberButtonWidthSize, '9', strNotifier),
                numberButton(context, numberButtonWidthSize, '0', strNotifier),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: Row(
              children: [
                ElevatedButton(
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
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      viewWidthSize.width * 0.5,
                      50,
                    ),
                  ),
                  child: Text('入力'),
                ),
                ElevatedButton(
                  onPressed: () {
                    strNotifier.state = numberStrDefault;
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      viewWidthSize.width * 0.5,
                      50,
                    ),
                  ),
                  child: Text('削除'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget numberButton(BuildContext context, double width, String number,
    StateController<String> controller) {
  return ElevatedButton(
    onPressed: () {
      if (controller.state == numberStrDefault) {
        controller.state = number;
      } else if (controller.state.length == 2) {
        showDialog<void>(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text('これ以上入力できません。',
                    style: TextStyle(
                      fontSize: 20,
                    )),
              );
            });
      } else {
        controller.state = controller.state + number;
      }
    },
    style: ElevatedButton.styleFrom(
      fixedSize: Size(
        width,
        50,
      ),
    ),
    child: Text(number),
  );
}

// Comsumer
// 任意の場所でプロバイダーを使いたい場合に使用
class StateProviderTestPage2 extends StatelessWidget {
  const StateProviderTestPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateProviderテスト(Minus)'),
      ),
      drawer: NavigationComponentWidget(),
      body: Column(
        children: [
          Consumer(
            builder: (context, ref, child) => Center(
              child: Text(
                '${ref.watch(countProvider)}',
                style: const TextStyle(
                    fontSize: 30, color: Colors.lightBlueAccent),
              ),
            ),
          ),
          Consumer(
            builder: (context, ref, child) => Center(
              child: ElevatedButton(
                child: Text('Minus'),
                onPressed: () {
                  // 値が必要なだけだからwatchよりreadの方があってる？
                  // ref.watch(countProvider.notifier).state--;
                  ref.read(countProvider.notifier).state--;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
