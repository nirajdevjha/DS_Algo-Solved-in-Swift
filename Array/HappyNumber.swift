/*
    Question - Happy Number
    Link - https://leetcode.com/problems/happy-number/
 */

class Solution {
    func isHappy(_ n: Int) -> Bool {
        var mySet = Set<Int>()
        var num: Int = n
        
        while num != 1 {
            guard !mySet.contains(num) else {
                return false
            }
            mySet.insert(num)
            var temp = 0
            while num != 0{
                temp += (num % 10) * (num % 10)
                num /= 10
            }
            num = temp
        }
        return true
    }
}
