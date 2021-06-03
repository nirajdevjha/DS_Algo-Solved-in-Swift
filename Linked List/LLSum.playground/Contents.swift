
class LL<T> {
    var value: T
    var nextLL: LL<T>?

    convenience init?(_ values: T...) {
        self.init(Array(values))
    }

    init?(_ values: [T]) {
        guard let first = values.first else {
            return nil
        }
        value = first
        nextLL = LL(Array(values.suffix(from: 1)))
    }
}

extension LL {
    func sum() -> Int {
        var sum = 0
        var currentNode: LL? = self
        while currentNode != nil {
            sum += currentNode?.value as! Int
            currentNode = currentNode?.nextLL
        }
        return sum
    }
}

if let l = LL([2, 4, 7, 10]) {
    print("Sum of LL is \(l.sum())")
}


