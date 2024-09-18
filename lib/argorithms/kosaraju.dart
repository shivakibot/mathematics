class WeightlessDirectedGraph {
  late int vertices;
  late List<List<int>> adjList;

  WeightlessDirectedGraph(int V) {
    vertices = V;
    adjList = List.generate(V, (index) => []);
  }

  void addEdge(int v, int w) {
    adjList[v].add(w);
  }

  void DFSUtil(int v, List<bool> visited, List<int> result) {
    visited[v] = true;
    result.add(v);

    for (var neighbor in adjList[v]) {
      if (!visited[neighbor]) {
        DFSUtil(neighbor, visited, result);
      }
    }
  }

  List<int> depthFirstSearch() {
    var visited = List.generate(vertices, (index) => false);
    var result = <int>[];

    for (var i = 0; i < vertices; i++) {
      if (!visited[i]) {
        DFSUtil(i, visited, result);
      }
    }

    return result.reversed.toList();
  }

  WeightlessDirectedGraph getReversedGraph() {
    var reversedGraph = WeightlessDirectedGraph(vertices);

    for (var v = 0; v < vertices; v++) {
      for (var neighbor in adjList[v]) {
        reversedGraph.addEdge(neighbor, v);
      }
    }

    return reversedGraph;
  }
}

/// Kosaraju’s Algorithm
/// 強連結成分(SCC) 分解
/// 通常のグラフで深さ優先探索を実行し、
/// その後、エッジの向きを逆にしたグラフでもう一度深さ優先探索を実行する。
List<List<int>> kosarajuAlgorithm(WeightlessDirectedGraph graph) {
  var result = <List<int>>[];

  var stack = graph.depthFirstSearch();
  var reversedGraph = graph.getReversedGraph();

  var visited = List.generate(graph.vertices, (index) => false);

  while (stack.isNotEmpty) {
    var v = stack.removeLast();
    if (!visited[v]) {
      var component = <int>[];
      reversedGraph.DFSUtil(v, visited, component);
      result.add(component);
    }
  }

  return result;
}

void main() {
  var graph = WeightlessDirectedGraph(5);
  graph.addEdge(1, 0);
  graph.addEdge(0, 2);
  graph.addEdge(2, 1);
  graph.addEdge(0, 3);
  graph.addEdge(3, 4);

  var components = kosarajuAlgorithm(graph);
  print("Strongly Connected Components:");
  for (var component in components) {
    print(component);
  }
}
