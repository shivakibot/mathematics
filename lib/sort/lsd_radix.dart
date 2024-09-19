class LSDRadixSort {
  /// 数字のみ
  void radixSort(List<int> arr) {
    int maxNumber = _getMax(arr); // 最大の数を取得
    int digitPlace = 1; // 1の位から始める

    // 最大の桁数だけループする
    while (maxNumber ~/ digitPlace > 0) {
      _countingSort(arr, digitPlace);
      digitPlace *= 10; // 10倍して次の桁に移動
    }
  }

  // 数値の配列の中で最大の数を取得する
  int _getMax(List<int> arr) {
    int max = arr[0];
    for (int i = 1; i < arr.length; i++) {
      if (arr[i] > max) {
        max = arr[i];
      }
    }
    return max;
  }

  // 桁ごとのCounting Sort（安定ソート）
  void _countingSort(List<int> arr, int digitPlace) {
    int n = arr.length;
    List<int> output = List.filled(n, 0); // 出力配列
    List<int> count = List.filled(10, 0); // カウント配列 (0-9の10種類の数字)

    // digitPlaceの桁でカウントを行う
    for (int i = 0; i < n; i++) {
      int digit = (arr[i] ~/ digitPlace) % 10;
      count[digit]++;
    }

    // 累積カウントを作成（安定ソートのため）
    for (int i = 1; i < 10; i++) {
      count[i] += count[i - 1];
    }

    // 出力配列を作成（安定ソートの実現）
    for (int i = n - 1; i >= 0; i--) {
      int digit = (arr[i] ~/ digitPlace) % 10;
      output[count[digit] - 1] = arr[i];
      count[digit]--;
    }

    // 出力配列を元の配列にコピー
    for (int i = 0; i < n; i++) {
      arr[i] = output[i];
    }
  }
}
