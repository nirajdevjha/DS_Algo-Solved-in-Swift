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

    var first: LinkedList? = head
    var second: LinkedList? = head

    var counter: Int = 1

    while counter <= k {
        second = second?.next
        counter += 1
    }

    //special case, when second becomes nil because k is >= no of nodes in LL.
    if second == nil {
        head.value = head.next?.value
        head.next = head.next?.next
        return
    }

    while second?.next != nil {
        first = first?.next
        second = second?.next
    }

    first?.next = first?.next?.next

  }
}



 // Definition for singly-linked list.
  public class ListNode {
     public var val: Int
    public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
  }


// Leetcode
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    var first: ListNode? = head
    var second: ListNode? = head

    var counter: Int = 1

    if second?.next == nil {
        return nil
    }

    while counter <= n {
        second = second?.next
        counter += 1
    }

    //special case, when second becomes nil because k is >= no of nodes in LL.
    if second == nil {
        head?.val = head?.next?.val ?? 0
        head?.next = head?.next?.next
        return head
    }

    while second?.next != nil {
        first = first?.next
        second = second?.next
    }

    first?.next = first?.next?.next

        return head

    }
}
