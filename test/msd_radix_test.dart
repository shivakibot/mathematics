import 'package:flutter_test/flutter_test.dart';
import 'package:mathematics/sort/msd_radix.dart';

void main() {
  List<String> input = [
    "apple",
    "ape",
    "banana",
    "band",
    "bat",
    "cat",
    "car",
    "dog",
    "deer"
  ];
  List<String> answer = [
    "ape",
    "apple",
    "banana",
    "band",
    "bat",
    "car",
    "cat",
    "deer",
    "dog"
  ];

  test('unit: MSDRadixSort', () {
    MSDRadixSort msdRadixSort = MSDRadixSort();
    msdRadixSort.sort(input);

    expect(input, answer);
  });
}
