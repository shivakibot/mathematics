/// bellman-Ford Algorithm
///
/// 負の値を許容、サイクルも許容だが、負のサイクルはエラー。
/// 負のサイクルは検知可能
///
/// 指定した頂点から各頂点への最短経路までを出力
/// クラス単位で最短経路の頂点を管理している為、クラスの使いまわしに注意
class BellmanFord {
  static late List<int> prevVertices;
  static List<int> shortestPath(DirectedGraph graph, int source) {
    List<int> distances = List.filled(graph.vertices, double.maxFinite.toInt());
    prevVertices = List.filled(graph.vertices, -1);
    distances[source] = 0;

    for (int i = 0; i < graph.vertices - 1; i++) {
      for (Edge edge in graph.edges) {
        if (distances[edge.source] != double.maxFinite.toInt() &&
            distances[edge.source] + edge.weight < distances[edge.destination]) {
          distances[edge.destination] = distances[edge.source] + edge.weight;
          prevVertices[edge.destination] = edge.source;
        }
      }
    }

    for (Edge edge in graph.edges) {
      if (distances[edge.source] != double.maxFinite.toInt() &&
          distances[edge.source] + edge.weight < distances[edge.destination]) {
        throw Exception("Negative cycle detected");
      }
    }

    return distances;
  }

  static List<int> reconstructPath(int destination) {
    List<int> path = [];
    int currentVertex = destination;

    while (currentVertex != -1) {
      path.add(currentVertex);
      currentVertex = prevVertices[currentVertex];
    }

    path = path.reversed.toList();
    return path;
  }
}
// void bellmanFord(DirectedGraph graph, int source) {
//   List<int> distances = List.filled(graph.vertices, double.maxFinite.toInt());
//   List<int> prevVertices = List.filled(graph.vertices, -1);
//   distances[source] = 0;
//
//   /// 負のサイクルがない前提での最短経路は、n-1の間に存在する
//   for (int i = 1; i < graph.vertices; i++) {
//     for (Edge edge in graph.edges) {
//       int u = edge.source;
//       int v = edge.destination;
//       int weight = edge.weight;
//
//       if (distances[u] != double.maxFinite.toInt() && distances[u] + weight < distances[v]) {
//         distances[v] = distances[u] + weight;
//         prevVertices[edge.destination] = edge.source;
//       }
//     }
//   }
//
//   /// 負のサイクルが存在する場合、最短経路が更新されてしまう。
//   for (Edge edge in graph.edges) {
//     int u = edge.source;
//     int v = edge.destination;
//     int weight = edge.weight;
//
//     if (distances[u] != double.maxFinite.toInt() && distances[u] + weight < distances[v]) {
//       debugPrint("Graph contains negative weight cycle.");
//       return;
//     }
//   }
//
//   // Print the shortest distances
//   for (int i = 0; i < graph.vertices; i++) {
//     debugPrint("Vertex $i: Distance = ${distances[i]}");
//   }
// }

class Edge {
  final int source;
  final int destination;
  final int weight;

  Edge(this.source, this.destination, this.weight);
}

class DirectedGraph {
  final int vertices;
  final List<Edge> edges;

  DirectedGraph(this.vertices, this.edges);
}