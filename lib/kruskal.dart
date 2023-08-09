import 'package:mathematics/union_find.dart';

class Edge implements Comparable<Edge> {
  int src, dest, weight;

  Edge(this.src, this.dest, this.weight);

  @override
  int compareTo(Edge other) {
    return weight.compareTo(other.weight);
  }
}

List<Edge> kruskal(List<Edge> edges, int vertices) {
  edges.sort();

  UnionFind uf = UnionFind(vertices);
  List<Edge> result = [];

  for (Edge edge in edges) {
    if (uf.find(edge.src) != uf.find(edge.dest)) {
      result.add(edge);
      uf.union(edge.src, edge.dest);
    }
  }

  return result;
}