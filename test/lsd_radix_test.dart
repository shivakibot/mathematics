import 'package:flutter_test/flutter_test.dart';
import 'package:mathematics/sort/lsd_radix.dart';

void main() {
  List<int> input = [170, 45, 75, 90, 802, 24, 2, 66];
  List<int> answer = [2, 24, 45, 66, 75, 90, 170, 802];

  test('unit: LSDRadixSort', (){
    LSDRadixSort sorter = LSDRadixSort();
    sorter.radixSort(input);

    expect(input, answer);
  });
}