import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mathematics/optimal_binary_search_tree.dart';

void main() {
  test('optimalBst test', () {
    List<double> keys = [1, 2, 3, 4, 5];
    List<double> probabilities = [0.15, 0.1, 0.05, 0.1, 0.2];
    Node? root = OptimalBST.constructOptimalBST(keys, probabilities);

    double searchKey = 3;
    Node? resultNode = OptimalBST.search(root, searchKey);
    if (resultNode != null) {
      debugPrint("Node found with key $searchKey");
    } else {
      debugPrint("Node not found with key $searchKey");
    }

    debugPrint("Inorder Traversal of Optimal BST:");
    inorderTraversal(root);
    //
    // double result = OptimalBST.optimalBST(keys, probabilities);
    // debugPrint("Optimal Binary Search Tree Cost: $result");
  });
}

void inorderTraversal(Node? node) {
  if(node == null){
    return;
  }
  inorderTraversal(node.left);
  debugPrint("Node key: ${node.key}");
  inorderTraversal(node.right);
}