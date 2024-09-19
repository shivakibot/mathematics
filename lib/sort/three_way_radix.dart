class ThreeWayRadixQuicksort {
  // 3-way Radix Quicksort のメイン関数
  void sort(List<String> arr) {
    _sort(arr, 0, arr.length - 1, 0);
  }

  // 3-way Radix Quicksort の再帰関数
  void _sort(List<String> arr, int low, int high, int d) {
    if (low >= high) return;

    int lt = low, gt = high;
    int v = _charAt(arr[low], d); // 基準となる文字を取得
    int i = low + 1;

    while (i <= gt) {
      int t = _charAt(arr[i], d);
      if (t < v) {
        _swap(arr, lt++, i++);
      } else if (t > v) {
        _swap(arr, i, gt--);
      } else {
        i++;
      }
    }

    // 基準文字が小さい部分、等しい部分、大きい部分に分けて再帰処理
    _sort(arr, low, lt - 1, d);   // 基準文字より小さい部分
    if (v >= 0) {
      _sort(arr, lt, gt, d + 1);  // 基準文字と等しい部分
    }
    _sort(arr, gt + 1, high, d);  // 基準文字より大きい部分
  }

  // 文字列のd番目の文字を取得する関数（範囲外なら -1 を返す）
  int _charAt(String s, int d) {
    if (d < s.length) {
      return s.codeUnitAt(d); // 文字のASCIIコードを返す
    } else {
      return -1; // 終端と扱う
    }
  }

  // 配列内の2つの要素を入れ替える
  void _swap(List<String> arr, int i, int j) {
    String temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }
}
