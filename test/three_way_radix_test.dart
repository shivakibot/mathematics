import 'package:flutter_test/flutter_test.dart';
import 'package:mathematics/sort/three_way_radix.dart';

void main() {
  List<String> input = [
    "she",
    "sells",
    "seashells",
    "by",
    "the",
    "seashore",
    "the",
    "shells",
    "she",
    "sells",
    "are",
    "surely",
    "seashells"
  ];
  List<String> answer = [
    "are",
    "by",
    "seashells",
    "seashells",
    "seashore",
    "sells",
    "sells",
    "she",
    "she",
    "shells",
    "surely",
    "the",
    "the"
  ];

  test('unit: ThreeWayRadixQuicksort', () {
    ThreeWayRadixQuicksort sorter = ThreeWayRadixQuicksort();
    sorter.sort(input);

    expect(input, answer);
  });
}
