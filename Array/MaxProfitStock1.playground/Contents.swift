import UIKit

/*
    Question -  Best Time to Buy and Sell Stock II
    Link - > https://leetcode.com/explore/featured/card/30-day-leetcoding-challenge/528/week-1/3287/
 */

    func maxProfit(_ prices: [Int]) -> Int {
        var output = 0
        guard prices.count > 1 else { return output }
        
        for i in 1..<prices.count where prices[i] > prices[i-1]{
            output += prices[i] - prices[i-1]
        }
        return output
    }

/**
 * Question Link: https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
 * Primary idea: Dynamic Programming, iterate the array while changing lowest
 *               when there is smaller value and update the result
 * Time Complexity: O(n), Space Complexity: O(1)
 *
 */

    func maxProfit1(prices: [Int]) -> Int {
        guard prices.count > 0 else { return 0 }
        var maxProfit = 0
        var buyDay = 0
        
        for i in 1..<prices.count {
            let profit = prices[i] - prices[buyDay]
            if profit < 0 {
                buyDay = i
            }
            maxProfit = max(maxProfit, profit)
        }
        return maxProfit
    }

print("Max profit \(maxProfit1(prices: [7,1,5,3,6,4]))")



