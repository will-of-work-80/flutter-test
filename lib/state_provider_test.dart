import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_test/navigation.dart';

final countProvider = StateProvider<int>((ref) {
  return 0;
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
    // 状態管理している値を操作できるようにする
    final countNotifier = ref.watch(countProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text('StateProviderテスト(Plus)'),
      ),
      drawer: NavigationComponentWidget(),
      body: Column(
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
    );
  }
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
