import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mathematics/dijkstra.dart';

void main() {
  test('dijkstra test', () {
    final graph = Graph(5);

    graph.addEdge(0, 1, 4);
    graph.addEdge(0, 2, 2);
    graph.addEdge(1, 2, 5);
    graph.addEdge(1, 3, 10);
    graph.addEdge(2, 4, 3);
    graph.addEdge(3, 4, 7);

    const startVertex = 0;
    final distances = graph.dijkstra(startVertex);
    debugPrint('Shortest distances from vertex $startVertex:');
    for (int i = 0; i < distances.length; i++) {
      debugPrint('Vertex $i: ${distances[i]}');
    }
    // final stronglyConnectedComponents = graph.kosaraju();
    // debugPrint('stronglyConnectedComponents $stronglyConnectedComponents');
    // expect(uf.isConnected(0, 7), true);
    // expect(uf.isConnected(2, 4), false);
  });
}