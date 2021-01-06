import Foundation

/*
 path sum 1:- https://leetcode.com/problems/path-sum/
 T- O(N) | S- O(N)
 **/
class Solution {
    class TreeNode {
        var value: Int
        var left: TreeNode?
        var right: TreeNode?
        
        init(value: Int) {
            self.value = value
        }
    }
    
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        guard let root = root else {
            return false
        }
        if (root.left == nil) && (root.right == nil) && (sum - root.value == 0) {
            return true
        }
        return hasPathSum(root.right, sum - root.value) || hasPathSum(root.left, sum - root.value)
    }
}


