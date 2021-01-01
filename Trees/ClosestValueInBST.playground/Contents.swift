import UIKit

/// Find the closest value in the BST.

///Input , target = 12
  /*
        10
     /     \
    5       15
    / \     / \
    2 5     13 22
             \
              15
*/
/// Output = 13


//Recursive solution
//Time & Space Complexity
//Average - O(log N) T | O(log N) S frames on stack
//worst - O(N) T | O(N) S frames on stack

//Iterative solution
//O(1) S in both best & worst

class Solution {
    class BST {
        var value: Int
        var left: BST?
        var right: BST?
        
        init(value: Int) {
            self.value = value
            left = nil
            right = nil
        }
    }
    
    //recursive solution, base case - tree is null, return closest
    func findClosestValueInBST(tree: BST?, target: Int) -> Int {
        var closest = tree!.value
        return findClosestValueInBSTHelper(tree: tree, target: target, closest: &closest)
    }
    
    func findClosestValueInBSTHelper(tree: BST?, target: Int, closest: inout Int) -> Int {
        guard let tree = tree else {
            return closest
        }
        
        /*let closestDiff = target - closest
         let currentDiff = target - tree.value
         if closestDiff.magnitude > currentDiff.magnitude {
         closest = tree.value
         } */
        
        if abs(target - closest) > abs(target - tree.value) {
            closest = tree.value
        }
        
        // move to left subTree
        if target < tree.value {
            if let left = tree.left {
                findClosestValueInBSTHelper(tree: left, target: target, closest: &closest)
            } else {
                return closest
            }
        }
        
        // move to right subTree
        if target > tree.value {
            if let right = tree.right {
                findClosestValueInBSTHelper(tree: right, target: target, closest: &closest)
            } else {
                return closest
            }
        }
        return closest
    }
    
    //iterative solution
    func findClosestValueInBSTHelper1(tree: BST?, target: Int, closest: inout Int) -> Int {
        var currentNode = tree
        
        while currentNode !== nil {
            if let node = currentNode {
                if abs(target - closest) > abs(target - node.value) {
                    closest = node.value
                }
            }
            if let node = currentNode, target < node.value {  // update current Node as left subTree
                currentNode = node.left
            } else if let node = currentNode, target > node.value { //update current Node as right subTree
                currentNode = node.right
            } else {
                break
            }
        }
        return closest
    }
}

let sol = Solution()
let rootNode = Solution.BST(value: 10)
let node1 = Solution.BST(value: 5)
let node2 = Solution.BST(value: 13)
let node3 = Solution.BST(value: 17)
let node4 = Solution.BST(value: 4)

rootNode.left = node1
rootNode.right = node2
node2.left = node3
node2.right = node4

let closest = sol.findClosestValueInBST(tree: rootNode, target: 12)
print("closest node is \(closest)")



