import UIKit

/**
* Question Link: https://leetcode.com/problems/same-tree/
* Primary idea: recursion
* Time Complexity: O(n), Space Complexity: O(n)
*/
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

class SameTree {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard let p = p else {
            return q == nil
        }
        guard let q = q else {
            return p == nil
        }
  
        if p.val != q.val {
            return false
        }
  
        return isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
    }
}
