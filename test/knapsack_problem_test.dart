import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mathematics/knapsack_problem.dart';

void main() {
  test('KnapsackProblem test', () {
    /// var
    List<int> weights = [2, 3, 4, 5];
    List<int> values = [3, 4, 5, 6];
    int capacity = 5;

    /// exec
    List<List<int>> dpTable = KnapsackProblem.buildDpTable(weights, values, capacity);
    int maxValue = KnapsackProblem.maxValue(dpTable);
    List<int> selectedItems = KnapsackProblem.knapsackBacktrack(dpTable, weights, values, capacity);

    debugPrint("dpTable: $dpTable");
    debugPrint("maxValue: $maxValue");
    debugPrint("selectedItems: $selectedItems");

    /// check answer
    int maxValueAnswer = 7;
    expect(maxValueAnswer, maxValue);

  });
}