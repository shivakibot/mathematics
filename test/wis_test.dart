import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mathematics/weighted_independent_set.dart';


void main() {
  test('weightedIndependentSet test', () {
    List<int> weights = [5, 1, 2, 7, 4, 6];
    int maxWeight = weightedIndependentSet(weights);
    debugPrint("最大独立集合の重みの合計: $maxWeight");
  });
}