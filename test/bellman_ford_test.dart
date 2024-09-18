import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mathematics/argorithms/bellman_ford.dart';

void main() {
  test('bellmanFord test', () {
    const int V = 5; // Number of vertices
    final List<Edge> edges = [
      Edge(0, 1, 4),
      Edge(0, 2, 2),
      Edge(1, 3, 3),
      Edge(2, 1, 1),
      Edge(2, 3, 5),
      Edge(3, 4, 2),
    ];

    final DirectedGraph graph = DirectedGraph(V, edges);
    const int source = 0;
    const int destination = 4;

    final List<int> distances = BellmanFord.shortestPath(graph, source);
    final List<int> shortestPath = BellmanFord.reconstructPath(destination);

    debugPrint("Shortest distance from $source to $destination: ${distances[destination]}");
    debugPrint("Shortest path: $shortestPath");

    // bellmanFord(graph, source);
    // debugPrint("Inorder Traversal of Optimal BST:");
  });
}