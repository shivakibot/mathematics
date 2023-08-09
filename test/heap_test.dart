import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mathematics/heap.dart';

void main() {
  test('CustomPriorityQueue test', () {
    // 最大値の取得
    var maxQueue = CustomPriorityQueue<int>((a, b) => a.compareTo(b));
    maxQueue.addAll([4, 9, 1, 7, 3]);
    debugPrint('Max Value: ${maxQueue.max}'); // 出力: Max Value: 9

    // 最小値の取得
    var minQueue = CustomPriorityQueue<int>((a, b) => a.compareTo(b));
    minQueue.addAll([4, 9, 1, 7, 3]);
    debugPrint('Min Value: ${minQueue.min}'); // 出力: Min Value: 1

    // カスタムのコンパレーター
    final pair1 = Pair(0, 4);
    final pair2 = Pair(1, 9);
    final pair3 = Pair(2, 1);
    final pair4 = Pair(3, 7);
    final pair5 = Pair(4, 3);
    var customComparatorQueue =
    CustomPriorityQueue<Pair>((a, b) => a.weight.compareTo(b.weight));
    customComparatorQueue.addAll([pair1, pair2, pair3, pair4, pair5]);
    debugPrint('Max Value with Custom Comparator: ${customComparatorQueue.max.vertex}');

    // カスタムのremoveWhere関数
    var customRemoveQueue = CustomPriorityQueue<int>((a, b) => a.compareTo(b));
    customRemoveQueue.addAll([4, 9, 1, 7, 3]);
    customRemoveQueue.customRemoveWhere((item) => item % 3 == 0);
    debugPrint('Queue after custom remove: $customRemoveQueue');
  });
}