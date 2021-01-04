import Foundation

/*
 Min Height BST construction / Convert Sorted Array to Binary Search Tree.
 Link:- https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/
 idea:- find middle elemnet of array and make it as root,
        elemnts to the left will go to the left of root, and elems to the right will go to right of root
        keep applying the same for all the subTree.
 Time Complexity:- O(N)
 Space Complexity:- O(N) where n = length of the array
 **/

class Program {
    
    class BST {
        var value: Int
        var left: BST?
        var right: BST?
        
        init(value: Int) {
            self.value = value
        }
    }
    
    static func minHeightBST(_ array: [Int]) -> BST? {
        return constructMinHeightBST(array, 0, array.count - 1)
    }
    
    static func constructMinHeightBST(_ array: [Int], _ startIdx: Int, _ endIdx: Int) -> BST? {
        if startIdx > endIdx {
            return nil
        }
        
        let midIdx = (startIdx + endIdx) / 2
        let bst = BST(value: array[midIdx])
        bst.left = constructMinHeightBST(array, startIdx, midIdx - 1)
        bst.right = constructMinHeightBST(array, midIdx + 1, endIdx)
        return bst
    }
}


