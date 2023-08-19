import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mathematics/johnson.dart';

void main() {
  test('Johnson test', () {
    Graph graph = Graph(4);
    graph.addEdge(0, 1, 3);
    graph.addEdge(0, 2, 6);
    graph.addEdge(1, 2, 3);
    graph.addEdge(2, 3, -2);
    graph.addEdge(3, 0, 2);
    graph.addEdge(3, 1, 4);

    try{
      final allShortestPaths = johnsonsAlgorithm(graph);
      for (var i = 0; i < allShortestPaths.length; i++) {
        debugPrint('Shortest paths from vertex $i:');
        for (var j = 0; j < allShortestPaths[i].length; j++) {
          debugPrint('  to vertex $j: ${allShortestPaths[i][j]}');
        }
      }
    }on Exception catch (_, e){
      fail("fail for ${e.toString()}");
    }


  });
}