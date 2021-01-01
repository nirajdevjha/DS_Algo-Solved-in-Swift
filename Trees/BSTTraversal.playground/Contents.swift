import Foundation

/*Traverse - inOrder, preOrder, postorder
Time Complexity:- O(N)
Space Complexity:- O(N) / O(d) where d = depth of longest branch
 **/
class Program {
    class BST {
        var value: Int?
        var left: BST?
        var right: BST?
        
        init(value: Int) {
            self.value = value
            left = nil
            right = nil
        }
    }
    
    func inOrderTraversal(tree: BST?, array: inout [Int]) -> [Int] {
        guard let tree = tree else { return [] }
        inOrderTraversal(tree: tree.left, array: &array)
        if let treeValue = tree.value {
            array.append(treeValue)
        }
        inOrderTraversal(tree: tree.right, array: &array)
        return array
    }
    
    func preOrderTraversal(tree: BST?, array: inout [Int]) -> [Int] {
        guard let tree = tree else { return [] }
        if let treeValue = tree.value {
            array.append(treeValue)
        }
        preOrderTraversal(tree: tree.left, array: &array)
        preOrderTraversal(tree: tree.right, array: &array)
        return array
    }
    
    func postOrderTraversal(tree: BST?, array: inout [Int]) -> [Int] {
        guard let tree = tree else { return [] }
        postOrderTraversal(tree: tree.left, array: &array)
        postOrderTraversal(tree: tree.right, array: &array)
        if let treeValue = tree.value {
            array.append(treeValue)
        }
        return array
    }
}


//Leetcode PostOrder
// https://leetcode.com/problems/binary-tree-postorder-traversal/
/*class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
       var array: [Int] = []
       array = postorderTraversallHelper(tree: root, array: &array)
       return array
    }
    
    func postorderTraversallHelper(tree: TreeNode?, array: inout [Int]) -> [Int] {
        guard let tree = tree else { return [] }
        postorderTraversallHelper(tree: tree.left, array: &array)
        postorderTraversallHelper(tree: tree.right, array: &array)
        array.append(tree.val)
        return array
    }
} */

