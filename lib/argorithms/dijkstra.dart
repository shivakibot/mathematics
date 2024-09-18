class PriorityQueue<T> {
  final List<MapEntry<T, int>> _heap = [];
  final Map<T, int> _indexMap = {};

  int _parent(int i) => (i - 1) ~/ 2;
  int _leftChild(int i) => 2 * i + 1;
  int _rightChild(int i) => 2 * i + 2;

  void _swap(int i, int j) {
    final temp = _heap[i];
    _heap[i] = _heap[j];
    _heap[j] = temp;
    _indexMap[_heap[i].key] = i;
    _indexMap[_heap[j].key] = j;
  }

  void _heapifyUp(int i) {
    while (i > 0 && _heap[_parent(i)].value > _heap[i].value) {
      _swap(i, _parent(i));
      i = _parent(i);
    }
  }

  void _heapifyDown(int i) {
    int minIndex = i;

    final left = _leftChild(i);
    if (left < _heap.length && _heap[left].value < _heap[minIndex].value) {
      minIndex = left;
    }

    final right = _rightChild(i);
    if (right < _heap.length && _heap[right].value < _heap[minIndex].value) {
      minIndex = right;
    }

    if (i != minIndex) {
      _swap(i, minIndex);
      _heapifyDown(minIndex);
    }
  }

  bool isEmpty() => _heap.isEmpty;

  void insert(T key, int priority) {
    if (_indexMap.containsKey(key)) {
      decreasePriority(key, priority);
      return;
    }

    _heap.add(MapEntry(key, priority));
    _indexMap[key] = _heap.length - 1;
    _heapifyUp(_heap.length - 1);
  }

  T? extractMin() {
    if (_heap.isEmpty) return null;

    final minEntry = _heap[0];
    _indexMap.remove(minEntry.key);

    if (_heap.length == 1) {
      _heap.clear();
      return minEntry.key;
    }

    _heap[0] = _heap.removeLast();
    _indexMap[_heap[0].key] = 0;
    _heapifyDown(0);

    return minEntry.key;
  }

  void decreasePriority(T key, int newPriority) {
    if (!_indexMap.containsKey(key)) return;

    final index = _indexMap[key];
    if (newPriority < _heap[index!].value) {
      _heap[index] = MapEntry(key, newPriority);
      _heapifyUp(index);
    }
  }
}


class Graph {
  final int vertices;
  late List<List<MapEntry<int, int>>> adjacencyList;

  Graph(this.vertices) : adjacencyList = List.generate(vertices, (_) => []);

  /// [MUST] weightは正の値にする。
  /// 仮に負の値になった場合、正しい実行結果とならない。
  void addEdge(int source, int destination, int weight) {
    adjacencyList[source].add(MapEntry(destination, weight));
  }

  /// dijkstraのアルゴリズム。
  /// スタート地点からのそれぞれ頂点に対する最短経路を算出。
  List<int> dijkstra(int startVertex) {
    final distances = List.generate(vertices, (_) => double.maxFinite.toInt());
    final priorityQueue = PriorityQueue<int>();

    distances[startVertex] = 0;
    priorityQueue.insert(startVertex, 0);

    while (!priorityQueue.isEmpty()) {
      final currentVertex = priorityQueue.extractMin();

      for (final edge in adjacencyList[currentVertex!]) {
        final destination = edge.key;
        final weight = edge.value;

        if (distances[currentVertex] + weight < distances[destination]) {
          distances[destination] = distances[currentVertex] + weight;
          priorityQueue.insert(destination, distances[destination]);
        }
      }
    }

    return distances;
  }
}

