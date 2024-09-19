class MSDRadixSort {
  // アルファベットの文字数（ここでは英字のみと仮定、拡張可能）
  static const int R = 256; // 256文字のASCII表を仮定（文字列用）

  // MSD Radix Sortのメイン関数
  void sort(List<String> arr) {
    List<String> aux = List<String>.filled(arr.length, ''); // 補助配列
    _sort(arr, aux, 0, arr.length - 1, 0);
  }

  // MSD Radix Sortの再帰関数
  void _sort(List<String> arr, List<String> aux, int low, int high, int d) {
    if (low >= high) return;

    // カウント用の配列とリストのインデックス範囲を調整
    List<int> count = List<int>.filled(R + 2, 0);

    // カウントステップ：d番目の文字に基づいて頻度を計算
    for (int i = low; i <= high; i++) {
      int c = _charAt(arr[i], d);
      count[c + 2]++; // 1オフセット調整
    }

    // 累積ステップ：文字列の配置場所を決定
    for (int r = 0; r < R + 1; r++) {
      count[r + 1] += count[r];
    }

    // 再配置ステップ：補助配列に文字列を配置
    for (int i = low; i <= high; i++) {
      int c = _charAt(arr[i], d);
      aux[count[c + 1]++] = arr[i];
    }

    // 元の配列に戻す
    for (int i = low; i <= high; i++) {
      arr[i] = aux[i - low];
    }

    // 各文字ごとに再帰的にソート
    for (int r = 0; r < R; r++) {
      _sort(arr, aux, low + count[r], low + count[r + 1] - 1, d + 1);
    }
  }

  // 文字列のd番目の文字を取得（dが範囲外なら -1 を返す）
  int _charAt(String s, int d) {
    if (d < s.length) {
      return s.codeUnitAt(d); // 文字のASCIIコードを返す
    } else {
      return -1; // 範囲外なら -1を返す（終端扱い）
    }
  }
}