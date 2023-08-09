import 'dart:collection';

class Graph {
  late Map<int, List<int>> adjList;

  Graph() {
    adjList = <int, List<int>>{};
  }

  void addEdge(int v1, int v2) {
    if (!adjList.containsKey(v1)) adjList[v1] = [];
    adjList[v1]?.add(v2);
  }

  void bfs(int start) {
    Queue<int> queue = Queue<int>();
    Set<int> visited = <int>{};
    queue.add(start);
    visited.add(start);

    while (queue.isNotEmpty) {
      int current = queue.removeFirst();
      // print(current);

      if (!adjList.containsKey(current)) continue;

      for (int neighbor in adjList[current]!) {
        if (!visited.contains(neighbor)) {
          visited.add(neighbor);
          queue.add(neighbor);
        }
      }
    }
  }

  void dfs(int start) {
    Set<int> visited = <int>{};
    _dfsHelper(start, visited);
  }

  void _dfsHelper(int current, Set<int> visited) {
    visited.add(current);
    // print(current);

    if (!adjList.containsKey(current)) return;

    for (int neighbor in adjList[current]!) {
      if (!visited.contains(neighbor)) {
        _dfsHelper(neighbor, visited);
      }
    }
  }
}

void main() {
  Graph graph = Graph();
  graph.addEdge(0, 1);
  graph.addEdge(0, 2);
  graph.addEdge(1, 2);
  graph.addEdge(2, 0);
  graph.addEdge(2, 3);
  graph.addEdge(3, 3);

  // print("BFS starting from vertex 2:");
  graph.bfs(2);

  // print("\nDFS starting from vertex 2:");
  graph.dfs(2);
}
