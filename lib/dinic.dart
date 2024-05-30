import 'dart:collection';

/// 最大フロー問題
/// Dinic Algorithm
/// 最大フローと最小カットの容量は一致
class MaxFlowSolver {
  final int inf = 1 << 30;
  late int n; // グラフのノード数
  late List<List<int>> capacity; // 容量行列
  late List<List<int>> adj; // 隣接行列

  MaxFlowSolver(int nodes) {
    n = nodes;
    capacity = List.generate(n, (i) => List<int>.filled(n, 0));
    adj = List.generate(n, (i) => []);
  }

  void addEdge(int from, int to, int cap) {
    capacity[from][to] += cap;
    adj[from].add(to);
    adj[to].add(from); // 逆辺も追加する
  }

  int dinicMaxFlow(int source, int sink) {
    int maxFlow = 0;
    List<int> level, ptr;

    while (true) {
      // レベルグラフを構築
      level = List.filled(n, -1);
      level[source] = 0;
      Queue<int> queue = Queue<int>()..add(source);

      while (queue.isNotEmpty) {
        int u = queue.removeFirst();
        for (int v in adj[u]) {
          if (level[v] == -1 && capacity[u][v] > 0) {
            level[v] = level[u] + 1;
            queue.add(v);
          }
        }
      }

      if (level[sink] == -1) {
        // シンクに到達不可能なら終了
        break;
      }

      // debugPrint('level: $level');

      // レベルグラフ上でDFSで増加パスを見つける
      ptr = List.from(adj.map((_) => 0)); // ポインタを初期化

      while (true) {
        int pushedFlow = dinicDFS(source, sink, inf, level, ptr);
        if (pushedFlow == 0) break;
        maxFlow += pushedFlow;
      }
    }

    return maxFlow;
  }

  int dinicDFS(int u, int sink, int flow, List<int> level, List<int> ptr) {
    if (u == sink) return flow;
    for (; ptr[u] < adj[u].length; ptr[u]++) {
      int v = adj[u][ptr[u]];
      if (level[v] == level[u] + 1 && capacity[u][v] > 0) {
        int pushedFlow = dinicDFS(v, sink, flow < capacity[u][v] ? flow : capacity[u][v], level, ptr);
        if (pushedFlow > 0) {
          /// ブロッキングフローが存在したので、フローグラフの流量及び容量を更新する
          capacity[u][v] -= pushedFlow;
          capacity[v][u] += pushedFlow;
          return pushedFlow;
        }
      }
    }
    return 0;
  }
}