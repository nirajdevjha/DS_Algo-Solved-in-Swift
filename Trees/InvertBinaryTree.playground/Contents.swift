import Foundation

/*
 Invert binary tree
 https://leetcode.com/problems/invert-binary-tree/
 **/

/*
 Input
      4
    /   \
   2     7
  / \   / \
 1   3 6   9
 
 */

/*Output:

     4
   /   \
  7     2
 / \   / \
9   6 3   1
 
*/

class BinaryTree {
   var value: Int?
   var left: BinaryTree?
   var right: BinaryTree?
 }

class Program {
    func invertBinaryTree(tree: BinaryTree?) {
        guard let tree = tree else { return }
        swapLeftAndRight(tree: tree)
        invertBinaryTree(tree: tree.left)
        invertBinaryTree(tree: tree.right)
    }
    
    func swapLeftAndRight(tree: BinaryTree) {
        (tree.left, tree.right) = (tree.right, tree.left)
    }
}


