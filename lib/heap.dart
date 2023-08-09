import 'dart:collection';

class CustomPriorityQueue<E> extends SplayTreeSet<E> {
  CustomPriorityQueue(Comparator<E> compare) : super(compare);

  E get max => last;
  E get min => first;

  void customRemoveWhere(bool Function(E) test) {
    final itemsToRemove = <E>{};
    for (final item in this) {
      if (test(item)) {
        itemsToRemove.add(item);
      }
    }
    removeAll(itemsToRemove);
  }
}

class Pair {
  final int vertex;
  final int weight;

  Pair(this.vertex, this.weight);
}