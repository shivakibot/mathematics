import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mathematics/kruskal.dart';


void main() {
  test('kruskal test', () {
    int vertices = 6;
    List<Edge> edges = [
      Edge(0, 1, 4),
      Edge(0, 2, 3),
      Edge(1, 2, 1),
      Edge(1, 3, 2),
      Edge(2, 3, 4),
      Edge(3, 4, 2),
      Edge(4, 5, 6)
    ];

    List<Edge> minimumSpanningTree = kruskal(edges, vertices);

    debugPrint("Minimum Spanning Tree:");
    for (Edge edge in minimumSpanningTree) {
      debugPrint("${edge.src} - ${edge.dest} : ${edge.weight}");
    }
    // expect(alignedSequences[0], sequence1);
    // expect(alignedSequences[1], alignedSeq2);
  });
}