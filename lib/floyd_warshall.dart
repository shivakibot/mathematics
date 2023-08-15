import 'package:flutter/cupertino.dart';

/// Floyd-Warshall Algorithm
///
/// denseグラフにおいて All-Pairs Shortest Pathsを求める場合、
/// bellman-Ford Algorithm だと計算量がN^3-4となるが。
/// それをN^3にすることができる。
/// sparseグラフにおいてもbellman-Ford Algorithmより計算量は有利。
///
/// bellman-Ford Algorithm 同様、負の値、サイクルは許容するが、負のサイクルは許容しない
/// 負の値がない場合は、dijkstra の方でも良いかもしれない
class FloydWarshall {
  late List<List<double>> shortestDistances;
  late List<List<int>> nextVertices; // 新たな行列を追加
  final int numVertices;

  FloydWarshall(this.numVertices) {
    shortestDistances = List.generate(numVertices,
            (i) => List.generate(numVertices, (j) => i == j ? 0 : double.infinity));

    nextVertices = List.generate(numVertices,
            (i) => List.generate(numVertices, (j) => -1)); // 初期値として-1をセット
  }

  void addEdge(int from, int to, double weight) {
    shortestDistances[from][to] = weight;
    nextVertices[from][to] = to;
  }

  void run() {
    for (var k = 0; k < numVertices; k++) {
      for (var i = 0; i < numVertices; i++) {
        for (var j = 0; j < numVertices; j++) {
          if (shortestDistances[i][k] != double.infinity
              && shortestDistances[k][j] != double.infinity
              && shortestDistances[i][j] > shortestDistances[i][k] + shortestDistances[k][j]
          ) {
            shortestDistances[i][j] = shortestDistances[i][k] + shortestDistances[k][j];
            nextVertices[i][j] = nextVertices[i][k];
          }
        }
      }
    }

    for (var i = 0; i < numVertices; i++) {
      if (shortestDistances[i][i] < 0) {
        throw Exception("Negative cycle detected");
      }
    }
  }

  List<int> reconstructPath(int start, int end) {
    if (nextVertices[start][end] == -1) {
      return [];
    }

    List<int> path = [start];
    while (start != end) {
      start = nextVertices[start][end];
      path.add(start);
    }
    return path;
  }

  void printSolution() {
    debugPrint("Shortest distances between vertices:");
    for (var i = 0; i < numVertices; i++) {
      for (var j = 0; j < numVertices; j++) {
        if (shortestDistances[i][j] == double.infinity) {
          debugPrint("From $i to $j: No path");
        } else {
          var path = reconstructPath(i, j);
          debugPrint("From $i to $j: ${shortestDistances[i][j]}, Path: $path");
        }
      }
    }
  }
}