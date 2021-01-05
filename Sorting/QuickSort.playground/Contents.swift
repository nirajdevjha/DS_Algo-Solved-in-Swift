import Foundation

/*
 Implement quick sort algorithm
 basic idea is to use pivot index and left and right index
 T- Worst case: O(N^2), best case: O(N Log N), avg case: O(N Log N)
 S - O(N Log N)
 **/

class Program {
    func quickSort(_ array: inout [Int]) -> [Int] {
        quickSortHelper(&array, 0, array.count - 1)
        return array
    }

    func quickSortHelper(_ array: inout [Int], _ startIdx: Int, _ endIdx: Int) {
        //1. base condition
        if startIdx >= endIdx {
            return
        }
        let pivotIdx = startIdx
        var left = startIdx + 1
        var right = endIdx
        
        while left <= right {
            //2. swap elem at left & right
            if array[left] > array[pivotIdx] && array[right] < array[pivotIdx] {
                swap(&array, left, right)
            }
            
            if array[left] <= array[pivotIdx] {
                left += 1
            }
            
            if array[right] >= array[pivotIdx] {
                right -= 1
            }
        }
        //3. swap elem at pivot & right
        swap(&array, pivotIdx, right)
        
        let leftCount = right - 1 - startIdx
        let rightCount = endIdx - right + 1
        
        //4. leftSubarryIsSmall , smaller array should be handled first & then larger
        let leftSubarryIsSmall: Bool = leftCount < rightCount
        if leftSubarryIsSmall {
            quickSortHelper(&array, startIdx, right - 1)
            quickSortHelper(&array, right + 1, endIdx)
        } else {
            quickSortHelper(&array, right + 1, endIdx)
            quickSortHelper(&array, startIdx, right - 1)
        }
    }
    
    func swap(_ array: inout [Int], _ left: Int, _ right: Int) {
        (array[left], array[right]) = (array[right], array[left])
    }
}

let prg = Program()
var ip = [8, 6, 1, 4, 9, 6]
print("sorted array is \(prg.quickSort(&ip))")


