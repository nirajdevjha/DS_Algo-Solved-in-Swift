
//https://binarysearch.com/problems/Word-Machine
struct Stack<T> {
    private var array: [T] = []

    mutating func push(_ elem: T) {
        array.append(elem)
    }

    mutating func pop() -> T? {
        return array.popLast()
    }

    func peek() -> T? {
        return array.last
    }

    func isEmpty() -> Bool {
        return array.isEmpty
    }

    func count() -> Int {
        return array.count
    }
}

func wordMachine(arr: [String]) -> Int {
    var stack = Stack<Int>()
    
    for element in arr {
        
        var x: Int = 0, y: Int = 0
        
        switch element {
        case "+", "ADD":
            if stack.count() > 1,
               let xVal = stack.pop(),
               let yVal = stack.pop() {
                x = Int(xVal)
                y = Int(yVal)
                stack.push(x + y)
            }
            
        case "-", "SUB":
            
            if stack.count() > 1,
               let xVal = stack.pop(),
               let yVal = stack.pop() {
                x = Int(xVal)
                y = Int(yVal)
                stack.push(x - y)
            }
            
        case "*":
            if stack.count() > 1,
               let xVal = stack.pop(),
               let yVal = stack.pop() {
                x = Int(xVal)
                y = Int(yVal)
                stack.push(x * y)
            }
            
        case "/":
            if stack.count() > 1,
               let xVal = stack.pop(),
               let yVal = stack.pop() {
                x = Int(xVal)
                y = Int(yVal)
                stack.push(x / y)
            }
        case "DUP":
            if stack.count() > 0,
               let x = stack.peek() {
                stack.push(x)
            }
            
        default:
            stack.push(Int(element) ?? 0)
            
        }
    }
    return stack.peek() ?? -1
}

let a = wordMachine(arr: ["1", "5", "DUP", "3", "-"])
print(a)
