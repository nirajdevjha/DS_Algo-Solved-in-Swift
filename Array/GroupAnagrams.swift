/**
    Question - Group Anagrams
    Link - > https://leetcode.com/problems/group-anagrams/
 */

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var result = [String: [String]]()
        
        for str in strs {
            let sortedStr = String(str.sorted())
            result[sortedStr, default: []].append(str)
        }
        return Array(result.values)
    }
}
