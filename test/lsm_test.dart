import 'package:flutter_test/flutter_test.dart';
import 'package:mathematics/linalg/lsm.dart';

void main() {
  group('description', (){
    Lsm testcase = Lsm();
    setUpAll(() {});
    test('Lsm: linearRegression', (){
      // 入力データポイント (x, y)
      List<double> xValues = [1.0, 2.0, 3.0, 4.0, 5.0];
      List<double> yValues = [2.0, 3.0, 5.0, 7.0, 11.0];

      // answer
      double slopeA = 2.2;
      double interceptA = -1.0000000000000009;

      // 最小二乗法で線形回帰を計算
      var result = testcase.linearRegression(xValues, yValues);
      expect(result['slope'], slopeA);
      expect(result['intercept'], interceptA);

    });
    // test("'Lsm: nonlinearRegression'", (){
    //   // 観測データ
    //   List<double> xValues = [0.0, 0.5, 1.0, 1.5, 2.0];
    //   List<double> yValues = [1.0, 1.6, 2.7, 4.5, 7.4];
    //
    //   // 初期推定値
    //   double a = 1.0;
    //   double b = 0.5;
    //
    //   // answer
    //   double slopeA = 1.2859005913924053;
    //   double interceptA = -3.590765664035562;
    //
    //   // 非線形最小二乗法による推定
    //   Map<String, double> result = testcase.nonlinearRegression(xValues, yValues, a, b);
    //   // debugPrint("$result");
    //   expect(result['a'], slopeA);
    //   expect(result['b'], interceptA);
    // });
  });

}