/*
 Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.
 https://leetcode.com/problems/remove-duplicates-from-sorted-list/
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

    // T - O(N) | S - O(N)
    func removeDuplocatesFromLinkedList(_ linkedList: LinkedList) -> LinkedList {

        var currentNode: LinkedList? = linkedList

        while currentNode != nil {
            var nextDistinctNode = currentNode?.next

            while nextDistinctNode != nil && nextDistinctNode?.value == currentNode?.value {
                nextDistinctNode = nextDistinctNode?.next
            }
            currentNode?.next = nextDistinctNode
            currentNode = nextDistinctNode
        }
        return linkedList
    }

}


