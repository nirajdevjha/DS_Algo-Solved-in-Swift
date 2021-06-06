

//https://binarysearch.com/problems/Maximum-Number-by-Inserting-Five/

//T- O(N) | S- O(N)

func get(n: Int) -> [Int] {
    var num = n
    var numArray: [Int] = []
    while num > 0 {
        numArray.append(num % 10)
        num /= 10
    }
    return numArray
}


func maxNumberByInsertingNumToIns(n: Int, numToInsert: Int) -> Int {
    let numArray: [Int] = get(n: abs(n))

    //negative case
    if n < 0 {
        var outputNo = 0
        var numArrayCount = numArray.count - 1

        while numArrayCount >= 0 && numArray[numArrayCount] <= numToInsert {
            outputNo = (10 * outputNo) + numArray[numArrayCount];
            numArrayCount -= 1
        }
        outputNo = (10 * outputNo) + numToInsert;
        while numArrayCount >= 0 {
            outputNo = (10 * outputNo) + numArray[numArrayCount];
            numArrayCount -= 1
        }
        return -outputNo
    }

    var outputNo = 0
    var numArrayCount = numArray.count - 1

    while numArrayCount >= 0 && numArray[numArrayCount] >= numToInsert {
        outputNo = (10 * outputNo) + numArray[numArrayCount];
        numArrayCount -= 1
    }
    outputNo = (10 * outputNo) + numToInsert
    while numArrayCount >= 0 {
        outputNo = (10 * outputNo) + numArray[numArrayCount];
        numArrayCount -= 1
    }
    return outputNo
}

/*func maxNumberByInsertingNumToIns(n: Int, numToIns: Int) -> Int {
    var num = n
    var numArray: [Int] = []
    var numToInsert = numToIns

    if num > 0 {
        while num > 0 {
            numArray.append(num % 10)
            num /= 10
        }
    } else {
        while num < 0 {
            numArray.append(num % 10)
            num /= 10
        }
    }

    var outputArray: [Int] = []

    var numArrayCount: Int = numArray.count - 1
    var isInserted = false

    while numArrayCount >= 0 {
        if n > 0 {
            if isInserted || numArray[numArrayCount] > numToInsert {
                outputArray.append(numArray[numArrayCount])
                numArrayCount -= 1
            } else {
                if !isInserted {
                    outputArray.append(numToInsert)
                    isInserted = true
                }
            }
        } else {
            if isInserted || numArray[numArrayCount] < numToInsert {
                outputArray.append(numArray[numArrayCount])
                numArrayCount -= 1
            } else {
                if !isInserted {
                    outputArray.append(numToInsert * -1)
                    isInserted = true
                }
            }
        }
    }
    if !isInserted {
        outputArray.append(numToInsert)
    }
    print("outputArray\(outputArray)")

    var stringOpArray = ""
    _ = outputArray.map{ stringOpArray = stringOpArray + "\($0)" }
    return Int(stringOpArray) ?? 0
}

print(maxNumberByInsertingNumToIns(n: -243, numToIns: 9)) // -2439
print(maxNumberByInsertingNumToIns(n: 578, numToIns: 5))

func maxNumberByInsertinNumToInsWithReorder(n: Int, numToIns: Int) -> Int {
    var num = n
    var numArray: [Int] = []
    var numToInsert = numToIns

    if num > 0 {
        while num > 0 {
            numArray.append(num % 10)
            num /= 10
        }
        numArray = numArray.sorted(by: <)
    } else {
        while num < 0 {
            numArray.append(num % 10)
            num /= 10
        }
        numArray = numArray.sorted(by: >)
    }

    var outputArray: [Int] = []

    var numArrayCount: Int = numArray.count - 1

    while numArrayCount >= 0 {
        if numArray[numArrayCount] > numToInsert {
            outputArray.append(numArray[numArrayCount])
            numArrayCount -= 1
        } else {
            if numToInsert >= 0 {
                outputArray.append(numToInsert)
                numToInsert = -1
            }
        }
    }


    var stringOpArray = ""
    _ = outputArray.map{ stringOpArray = stringOpArray + "\($0)" }
    return Int(stringOpArray) ?? 0
} */

print(maxNumberByInsertingNumToIns(n: 8349, numToInsert: 9))
