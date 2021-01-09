
 /*
 Given a binary tree, you need to compute the length of the diameter of the tree. The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.
 https://leetcode.com/problems/diameter-of-binary-tree/
 T - O(N)  | S - O(N)
 
          1
         / \
        2   3
       / \
      4   5
Return 3, which is the length of the path [4,2,1,3] or [5,2,1,3].
 
**/

class Program {
    class BinaryTree {
        var value: Int
        var left: BinaryTree?
        var right: BinaryTree?
        
        init(value: Int) {
            self.value = value
            left = nil
            right = nil
        }
    }
    
    class TreeInfo {
        var diameter: Int
        var height: Int
        
        init(_ diameter: Int, _ height: Int) {
            self.diameter = diameter
            self.height = height
        }
    }
    
    func binaryTreeDiameter(_ tree: BinaryTree) -> Int {
        return getTreeInfo(tree).diameter
    }
    
    func getTreeInfo(_ tree: BinaryTree?) -> TreeInfo {
        guard let tree = tree else {
            return TreeInfo(0, 0)
        }
        
        let leftTreeInfo = getTreeInfo(tree.left)
        let rightTreeInfo = getTreeInfo(tree.right)
        
        
        let longestPathThroughRoot = leftTreeInfo.height + rightTreeInfo.height
        let maxDiameterSoFar = max(leftTreeInfo.diameter, rightTreeInfo.diameter)
        let currentDiameter = max(longestPathThroughRoot, maxDiameterSoFar)
        let currentHeight = 1 + max(leftTreeInfo.height, rightTreeInfo.height)
        return TreeInfo(currentDiameter, currentHeight)
    }
}

