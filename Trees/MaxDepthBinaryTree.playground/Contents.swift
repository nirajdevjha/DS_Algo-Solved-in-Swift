import UIKit

/**
* Question Link: https://leetcode.com/problems/maximum-depth-of-binary-tree/
* Primary idea: recursion, return 0 when it is a leaf node
* Time Complexity: O(n), Space Complexity: O(1)
*/


 // Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func maxDepth(_ root: TreeNode?) -> Int {
    guard let root = root else {
        return 0
    }
    
    return max(maxDepth(root.left), maxDepth(root.right)) + 1
}


