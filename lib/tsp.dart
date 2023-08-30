/// 巡回セールスマン問題
/// n^2 * 2^n
/// pos :出発点のインデックス
/// mask :出発点のbitを立てたビット値
class TSPSolver {
  final List<List<double>> distances;
  late List<List<double>> dp;
  late List<List<int>> parent;
  late int n;

  TSPSolver(this.distances) {
    n = distances.length;
    dp = List.generate(1 << n, (i) => List.filled(n, double.infinity));
    parent = List.generate(1 << n, (i) => List.filled(n, -1));
  }

  double solve(int mask, int pos) {
    if (mask == (1 << n) - 1) {
      return distances[pos][0]; // Return to the starting city
    }

    if (dp[mask][pos] != double.infinity) {
      return dp[mask][pos];
    }

    for (int next = 0; next < n; next++) {
      if ((mask & (1 << next)) == 0) {
        double newDistance = distances[pos][next] + solve(mask | (1 << next), next);
        if (newDistance < dp[mask][pos]) {
          dp[mask][pos] = newDistance;
          parent[mask][pos] = next;
        }
      }
    }

    return dp[mask][pos];
  }

  List<int> findPath() {
    int mask = 1;
    double minDistance = double.infinity;
    int endingCity = -1;

    for (int i = 1; i < n; i++) {
      double distance = distances[0][i] + solve(mask | (1 << i), i);
      if (distance < minDistance) {
        minDistance = distance;
        endingCity = i;
      }
    }

    int currentMask = mask | (1 << endingCity);
    int currentPos = endingCity;
    List<int> path = [0, endingCity];

    while (currentMask != (1 << n) - 1) {
      int nextCity = parent[currentMask][currentPos];
      path.add(nextCity);
      currentMask |= (1 << nextCity);
      currentPos = nextCity;
    }

    path.add(0); // Return to the starting city
    return path;
  }
}