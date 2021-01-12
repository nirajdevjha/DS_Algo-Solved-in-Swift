

/*
 Implement BFS : Graph
 T - O(V + E)   | S - O(V)
**/

class Program {
  class Node {
    var name: String
    var children: [Node]

    init(name: String) {
      self.name = name
      children = []
    }

    func addChild(name: String) -> Node {
      let childNode = Node(name: name)
      children.append(childNode)

      return self
    }

    func breadthFirstSearch(array: inout [String]) -> [String] {
        var queue = [self]
        
        while !queue.isEmpty {
            let currentNode = queue.removeFirst()
            array.append(currentNode.name)
            queue.append(contentsOf: currentNode.children)
//            for child in currentNode.children {
//                queue.append(child)
//            }
        }
        return array
    }
  }
}

