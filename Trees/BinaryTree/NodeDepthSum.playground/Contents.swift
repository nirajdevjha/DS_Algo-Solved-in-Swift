import Foundation

/*
 Compute depth of all nodes from root and sum it up and return
 f(n, d) = d + f(l, d+1) + f(r, d+1) where d = depth, l = left child, r = right child
 T- O(N)  | S- O(h) where h = height of binary tree
 **/

class Program {
    class BinaryTree {
        var value: Int
        var left: BinaryTree?
        var right: BinaryTree?
        
        init(value: Int) {
            self.value = value
        }
    }
    
    static func nodeDepths(_ root: BinaryTree?, _ depth: Int = 0) -> Int {
        guard let tree = root else {
            return 0
        }
        return depth + nodeDepths(tree.left, depth + 1) + nodeDepths(tree.right, depth + 1)
    }
}
