import Foundation

//Two Sum:- Given an array of integers nums and an integer target, return the two numbers such that they add up to target.

class Program {
    
    //T - O(N*N)
    //S - O(1)
    func twoNumberSum1(_ array: [Int], _ targetSum: Int) -> [Int] {
        for i in 0 ..< array.count {
            for j in i + 1 ..< array.count {
                if array[i] + array[j] == targetSum {
                    return [array[i], array[j]]
                }
            }
        }
        return []
    }
    
    //T - O(N)
    //S - O(N)
    func twoNumberSum2(_ array: [Int], _ targetSum: Int) -> [Int] {
        var numbersToIndexDict: [Int: Int] = [:]
        for (idx, num) in array.enumerated() {
            let potentialMatch = targetSum - num
            if let _ = numbersToIndexDict[potentialMatch] {
                return [potentialMatch, num]
            } else {
               numbersToIndexDict[num] = idx
            }
        }
        return []
    }
    
    //T - O(N Log N)
    //S - O(N)
    func twoNumberSum3(_ array: inout [Int], _ targetSum: Int) -> [Int] {
        array.sort { s1, s2 -> Bool in
            s1 < s2
        }
        var left = 0
        var right = array.count - 1
        
        while left < right {
            let leftMost = array[left]
            let rightMost = array[right]
            let currentSum = leftMost + rightMost
            
            if currentSum == targetSum {
                return [leftMost, rightMost]
            } else if currentSum < targetSum {
                left += 1
            } else if currentSum > targetSum {
                right -= 1
            }
        }
        
        return []
    }
}

let prg = Program()
let pair1 = prg.twoNumberSum1([3, 5, -4, 8, 11, 1, -1, 6], 10)
print(pair1)
var input = [4, 6, 1]

let pair2 = prg.twoNumberSum2(input, 5)
print(pair2)

let pair3 = prg.twoNumberSum3(&input, 5)
print(pair3)

