/*
 Nth node from end in LL
 https://leetcode.com/problems/remove-nth-node-from-end-of-list/
 T - O(N) | S - O(1)
 **/


class Program {

  class LinkedList {
    var value: Int?
    var next: LinkedList?

    init(value: Int) {
        self.value = value
        self.next = nil
    }
  }

  func removeKthNodeFromEnd(head: LinkedList, k: Int) {
    
  }
    
}

var abc = "airoplanes"
let closure = { [abc] in
   print("I love \(abc)")
}

abc = "ships"

closure()

var thing = "airoplanes"

let closure1 = {
  print("I love \(thing)")
}

thing = "airplanes"

closure() // Prints: "I love airplanes"

