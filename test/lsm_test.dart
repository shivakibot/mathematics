import 'package:flutter_test/flutter_test.dart';
import 'package:mathematics/linalg/lsm.dart';

void main() {
  test('unit: LSDRadixSort', (){
    // 入力データポイント (x, y)
    List<double> xValues = [1.0, 2.0, 3.0, 4.0, 5.0];
    List<double> yValues = [2.0, 3.0, 5.0, 7.0, 11.0];

    // answer
    double slopeA = 2.2;
    double interceptA = -1.0000000000000009;

    // 最小二乗法で線形回帰を計算
    var result = linearRegression(xValues, yValues);
    expect(result['slope'], slopeA);
    expect(result['intercept'], interceptA);
  });
}