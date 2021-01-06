import Foundation

/*
 return array of sum of the branch nodes, start from root till leaf
 primary idea is to traverse from root till each leaf, and append the sum of all values to output array recursively for each subtree
 T- O(N) | S- O(N), as we cant have more branches then N nodes, number of leaf nodes is roughly N/2
 **/
class Program {
    class TreeNode {
        var value: Int
        var left: TreeNode?
        var right: TreeNode?
        
        init(value: Int) {
            self.value = value
        }
    }
    
    func branchSums(root: TreeNode) -> [Int] {
        var sums: [Int] = []
        calculateBranchSums(node: root, runningSum: 0, sums: &sums)
        return sums
    }
    
    func calculateBranchSums(node: TreeNode?, runningSum: Int, sums: inout [Int]) {
        guard let node = node else { return }
        let newRunningSum = runningSum + node.value
        if node.left == nil && node.right == nil {
            sums.append(newRunningSum)
            return
        }
        calculateBranchSums(node: node.left, runningSum: newRunningSum, sums: &sums)
        calculateBranchSums(node: node.right, runningSum: newRunningSum, sums: &sums)
    }
}

let prg = Program()
let rootNode = Program.TreeNode(value: 10)
let node1 = Program.TreeNode(value: 5)
let node2 = Program.TreeNode(value: 13)
let node3 = Program.TreeNode(value: 17)
let node4 = Program.TreeNode(value: 4)

rootNode.left = node1
rootNode.right = node2
node2.left = node3
node2.right = node4

let sumsArray = prg.branchSums(root: rootNode)
print("sumsArray is \(sumsArray)")



