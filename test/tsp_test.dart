import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mathematics/tsp.dart';

void main() {
  test('minVertexCover test', () {
    List<List<double>> distances = [
      [0, 29, 20, 21],
      [29, 0, 15, 17],
      [20, 15, 0, 28],
      [21, 17, 28, 0],
    ];

    TSPSolver tspSolver = TSPSolver(distances);
    double shortestDistance = tspSolver.solve(1, 0); // Start from city 0
    List<int> shortestPath = tspSolver.findPath();

    debugPrint("Shortest Distance: $shortestDistance");
    debugPrint("Shortest Path: $shortestPath");
  });
}