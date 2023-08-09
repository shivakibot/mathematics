import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mathematics/union_find.dart';

void main() {
  test('UnionFind test', () {
    int n = 10; // Number of elements

    UnionFind uf = UnionFind(n);

    uf.union(0, 1);
    uf.union(2, 3);
    uf.union(4, 5);
    uf.union(6, 7);
    uf.union(1, 3);
    uf.union(3, 7);

    debugPrint("Is 0 connected to 7? ${uf.isConnected(0, 7)}"); // Should print true
    debugPrint("Is 2 connected to 4? ${uf.isConnected(2, 4)}"); // Should print false
    expect(uf.isConnected(0, 7), true);
    expect(uf.isConnected(2, 4), false);
  });
}