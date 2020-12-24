import UIKit

/*
 https://leetcode.com/problems/contains-duplicate/solution/
 */
//O(n)
func containsDuplicate(_ nums: [Int]) -> Bool {
    var mySet: Set<Int> = []
    for num in nums {
        if mySet.contains(num) {
            return true
        } else {
            mySet.insert(num)
        }
    }
    return false
}

//O(nLogN)
func containsDuplicate1(_ nums: [Int]) -> Bool {
    var numbers = nums
    numbers = numbers.sorted(by: { (s1, s2) -> Bool in
        return s1 < s2
    })
    for (idx, _) in numbers.enumerated() {
        guard idx+1 < numbers.count else {continue}
        if numbers[idx] == numbers[idx+1] {
            return true
        }
    }
    return false
}

//O(n)
func containsDuplicate2(_ nums: [Int]) -> Bool {
       return nums.count > Set(nums).count
}

containsDuplicate([1,1,1,3,3,4,3,2,4,2])
containsDuplicate([7,8,1,9])
containsDuplicate([7,8,7,9])

containsDuplicate1([1,1,1,3,3,4,3,2,4,2])
containsDuplicate1([7,8,1,9])
containsDuplicate1([7,8,7,9])

containsDuplicate2([1,1,1,3,3,4,3,2,4,2])
containsDuplicate2([7,8,1,9])
containsDuplicate2([7,8,7,9])


/*
 Contains duplicate 2
https://leetcode.com/problems/contains-duplicate-ii/
 */

func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
    guard nums.count > 1 else { return false }
    
    var numsToLastIndex: [Int: Int] = [:]
    
    for (idx, num) in nums.enumerated() {
        if let lastIndex = numsToLastIndex[num], idx - lastIndex <= k {
            return true
        } else {
            numsToLastIndex[num] = idx
        }
    }
    return false
}

containsNearbyDuplicate([1,0,1,1], 1)
containsNearbyDuplicate([1,2,3,1,2,3], 2)

