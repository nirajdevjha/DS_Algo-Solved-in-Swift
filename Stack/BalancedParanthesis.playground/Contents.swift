import UIKit


/*
 Balanced Paraenthesis
 https://leetcode.com/problems/valid-parentheses/
  T- O(N), S- O(N)
 **/

func balancedBrackets(string: String) -> Bool {
    let openBrackets = "({["
    let closeBrackets = ")}]"
    let matchingBracketsDict: [Character: Character] = [")": "(", "}": "{", "]": "["]
    var stack: [Character] = []
    
    for char in string {
        if openBrackets.contains(char) {
            stack.append(char)
        } else if closeBrackets.contains(char) {
            if stack.isEmpty {
                return false
            } else {
                if let lastElem = stack.last,
                    lastElem == matchingBracketsDict[char] {
                    stack.popLast()
                } else {
                    return false
                }
            }
        }
    }
    return stack.isEmpty
}

balancedBrackets(string: "([]){}")
balancedBrackets(string: "(")

func isValid(_ sequence: String) -> Bool {
    var stack = [Character]()
    for bracket in sequence {
        switch bracket {
        case "{", "[", "(":
            stack.append(bracket)
        case "}", "]", ")":
            if stack.isEmpty
                || (bracket == "}" && stack.last != "{")
                || (bracket == "]" && stack.last != "[")
                || (bracket == ")" && stack.last != "(")  {
                return false
            }
            stack.popLast()
        default:
            break
        }
    }
    return stack.isEmpty
}

isValid("([]){}")
