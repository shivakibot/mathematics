import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mathematics/argorithms/dinic.dart';

void main() {
  test('MaxFlow test', () {
    MaxFlowSolver solver = MaxFlowSolver(6); // ノード数を設定

    // グラフに辺を追加
    solver.addEdge(0, 1, 10);
    solver.addEdge(0, 2, 15);
    solver.addEdge(1, 2, 15);
    solver.addEdge(1, 3, 10);
    solver.addEdge(2, 3, 10);
    solver.addEdge(2, 4, 5);
    solver.addEdge(3, 4, 15);
    solver.addEdge(3, 5, 10);
    solver.addEdge(4, 5, 15);
    // debugPrint('INF: ${solver.inf}');
    debugPrint('初回容量行列: ${solver.capacity}');
    int maxFlow = solver.dinicMaxFlow(0, 5); // ソースからシンクへの最大フローを計算

    debugPrint('最大フロー: $maxFlow'); // A: 25
    debugPrint('最終容量行列: ${solver.capacity}');
    debugPrint('隣接行列: ${solver.adj}');
  });
}