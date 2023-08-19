import 'dart:collection';

/// johnson's Algorithm
/// 負の値を許容するが、計算量をベルマンフォードより大半の場合減らせることができ
/// ダイクストラによる全経路探索と同等となる。
///
/// 全頂点に到達する仮頂点を追加した状態でベルマンフォードを実行し、
/// 各頂点の再重み付けの為の頂点価値を算出。
/// その後、再重み付けを行ったグラフに対してダイクストラによる全経路探索を行う。
///
/// 負のサイクルはベルマンフォードで検知しエラーとなる。
List<List<int>> johnsonsAlgorithm(Graph graph) {
  final modifiedGraph = Graph(graph.vertices + 1);

  for (var i = 0; i < graph.vertices; i++) {
    modifiedGraph.addEdge(graph.vertices, i, 0);
  }

  final h = bellmanFord(modifiedGraph, graph.vertices);

  final modifiedEdges = List.of(graph.edges);
  for (var edge in modifiedEdges) {
    edge.weight += h[edge.source] - h[edge.destination];
  }

  final allShortestPaths = List.generate(graph.vertices, (index) {
    final distances = dijkstra(graph, index);
    for (var i = 0; i < distances.length; i++) {
      distances[i] += h[i] - h[index];
    }
    return distances;
  });

  return allShortestPaths;
}

class Edge {
  final int source;
  final int destination;
  late int weight;

  Edge(this.source, this.destination, this.weight);
}

class Graph {
  final int vertices;
  final List<Edge> edges = [];

  Graph(this.vertices);

  void addEdge(int source, int destination, int weight) {
    edges.add(Edge(source, destination, weight));
  }
}

List<int> bellmanFord(Graph graph, int startVertex) {
  final distances = List.filled(graph.vertices, double.maxFinite.toInt());
  distances[startVertex] = 0;

  for (var i = 0; i < graph.vertices - 1; i++) {
    for (final edge in graph.edges) {
      if (distances[edge.source] + edge.weight < distances[edge.destination]) {
        distances[edge.destination] = distances[edge.source] + edge.weight;
      }
    }
  }

  for (final edge in graph.edges) {
    if (distances[edge.source] + edge.weight < distances[edge.destination]) {
      throw Exception('Negative-weight cycle found');
    }
  }

  return distances;
}

List<int> dijkstra(Graph graph, int startVertex) {
  final distances = List.filled(graph.vertices, double.maxFinite.toInt());
  distances[startVertex] = 0;

  final priorityQueue = SplayTreeSet<int>((a, b) => distances[a].compareTo(distances[b]));
  priorityQueue.add(startVertex);

  while (priorityQueue.isNotEmpty) {
    final currentVertex = priorityQueue.first;
    priorityQueue.remove(currentVertex);

    for (final edge in graph.edges) {
      if (edge.source == currentVertex) {
        final newDistance = distances[currentVertex] + edge.weight;
        if (newDistance < distances[edge.destination]) {
          priorityQueue.remove(edge.destination);
          distances[edge.destination] = newDistance;
          priorityQueue.add(edge.destination);
        }
      }
    }
  }

  return distances;
}

