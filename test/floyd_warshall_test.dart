import 'package:flutter_test/flutter_test.dart';
import 'package:mathematics/argorithms/floyd_warshall.dart';

void main() {
  test('floydWarshall test', () {
    final fw = FloydWarshall(4);

    fw.addEdge(0, 1, 3);
    fw.addEdge(0, 2, 6);
    fw.addEdge(1, 0, 3);
    fw.addEdge(1, 2, 2);
    fw.addEdge(2, 0, 6);
    fw.addEdge(2, 1, 2);
    fw.addEdge(2, 3, 4);
    fw.addEdge(3, 2, 4);

    fw.run();
    fw.printSolution();
    // debugPrint("nextVertices: ${fw.nextVertices}");
    // debugPrint("double: ${fw.shortestDistances}");
  });
}