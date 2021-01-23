/*
 Count the occurrences of given digit in a number
 https://www.geeksforgeeks.org/count-the-occurence-of-digit-k-in-a-given-number-n-using-recursion/
 T - log10(N) S - O(N)
 **/

func countDigits(num: Int, givenDigit: Int) -> Int {
    if num == 0 {
        return 0
    }
    
    let digit = num % 10
    
    if digit == givenDigit {
        return 1 + countDigits(num: num / 10, givenDigit: givenDigit)
    }
    return countDigits(num: num / 10, givenDigit: givenDigit)
}

let occurences = countDigits(num: 51435, givenDigit: 5)
print("occurences of digit is \(occurences)")


