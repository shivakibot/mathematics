import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mathematics/kosaraju.dart';

void main() {
  test('kosaraju test', () {
    var graph = WeightlessDirectedGraph(11);
    graph.addEdge(0, 1);
    graph.addEdge(1, 2);
    graph.addEdge(2, 0);
    graph.addEdge(2, 3);
    graph.addEdge(3, 4);
    graph.addEdge(4, 5);
    graph.addEdge(5, 6);
    graph.addEdge(6, 3);
    graph.addEdge(7, 8);
    graph.addEdge(8, 9);
    graph.addEdge(9, 7);
    graph.addEdge(10, 7);
    graph.addEdge(7, 10);
    graph.addEdge(1, 9);
    graph.addEdge(4, 9);

    var stronglyConnectedComponents = kosarajuAlgorithm(graph);
    debugPrint("Strongly Connected Components: $stronglyConnectedComponents");
    int count = 1;
    for (var component in stronglyConnectedComponents) {
      debugPrint("component $count: $component");
      count++;
    }
  });
}