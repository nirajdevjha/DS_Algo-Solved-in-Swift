/*
    Question - Move Zeroes
    Link - > https://leetcode.com/problems/move-zeroes/
 */

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var nonZeroIdx: Int = 0
        
        for num in nums where num != 0{
            nums[nonZeroIdx] = num
            nonZeroIdx += 1
        }
        
        while nonZeroIdx < nums.count{
            nums[nonZeroIdx] = 0
            nonZeroIdx += 1
        }
    }
}

//can be done by swapping as well
//Reference:- https://www.youtube.com/watch?v=0rPuILjoVsg&feature=emb_logo
