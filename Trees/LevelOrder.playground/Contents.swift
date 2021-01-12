
/*
 Level order / BFS of binary tree
 https://leetcode.com/problems/binary-tree-level-order-traversal/
 T - O(N)  |  S - O(N)
 **/
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
 
class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else { return [] }
        var result: [[Int]] = []
        
        var queue: [TreeNode?] = []
        queue.append(root)
        
        while !queue.isEmpty {
            var count = queue.count - 1
            var temp: [Int] = []
            while count >= 0 {
                if let node = queue.removeFirst() {
                    temp.append(node.val)
                    count -= 1
                    if let left = node.left {
                        queue.append(left)
                        
                    }
                    if let right = node.right {
                        queue.append(right)
                    }
                }
            }
            
            result.append(temp)
        }
        return result
    }
}
