import Foundation

/*
 Validate BST
 Time Complexity - O(N)
 Space Complexity - O(d) == O(N) where d = depth of the binary tree, longest branch
 idea:- validated all subTrees using the BST property
 **/
class Solution {
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
    
    func validateBST(tree: BST) -> Bool {
        var minimum = Int.min
        var maximum = Int.max
        return validateBSTHelper(tree: tree, minimum: &minimum, maximum: &maximum)
    }
    
    func validateBSTHelper(tree: BST?, minimum: inout Int, maximum: inout Int) -> Bool {
        guard let tree = tree else { return true }
        if let treeValue = tree.value, treeValue < minimum || treeValue >= maximum {
            return false
        }
        if var treeValue = tree.value {
            let isLeftValid = validateBSTHelper(tree: tree.left, minimum: &minimum, maximum: &treeValue)
            let isRightValid = validateBSTHelper(tree: tree.right, minimum: &treeValue, maximum: &maximum)
            return isLeftValid && isRightValid
        }
        return false
    }
}

let sol = Solution()
let rootNode = Solution.BST(value: 1)
let node1 = Solution.BST(value: 1)
let node2 = Solution.BST(value: 125)
let node3 = Solution.BST(value: 50)
let node4 = Solution.BST(value: 85)

rootNode.left = node1
rootNode.right = node2
node1.left = node3
node1.right = node4

let isBSTValid = sol.validateBST(tree: rootNode)
print("Bst is valid -> \(isBSTValid)")



