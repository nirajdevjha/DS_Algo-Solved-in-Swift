import Foundation

/*
 Find nth Fib
 **/
class Program {
    
    //recursive
    // T - O(2^n) | S - O(N)
    func getNthFib(n: Int) -> Int {
        if n == 2 {
            return 1
        } else if n == 1 {
            return 0
        } else {
            return getNthFib(n: n - 1) + getNthFib(n: n - 2)
        }
    }
    //iterative
    // T - O(N) | S - O(1)
    func getNthFibIterative(n: Int) -> Int {
        var lastTwo: [Int] = [0, 1]
        var counter: Int = 3
        
        while counter <= n {
            let nextFib = lastTwo[0] + lastTwo[1]
            lastTwo[0] = lastTwo[1]
            lastTwo[1] = nextFib
            counter += 1
        }
        
        return n > 1 ? lastTwo[1] : lastTwo[0]
    }
}

let prg = Program()
let nthFib = prg.getNthFib(n: 6)
print(nthFib)

let nFib = prg.getNthFibIterative(n: 6)
print(nFib)
