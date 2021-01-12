/*
 Depth-First-Search - Graph
 T - O(V + E)
 S - O(V)
 **/


  class Node {
    let name: String
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

    func depthFirstSearch(array: inout [String]) -> [String] {
        array.append(name)
        
        for child in children {
            child.depthFirstSearch(array: &array)
        }
        return array
    }
  }


let p = Node(name: "B")
p.addChild(name: "A")
p.addChild(name: "L")
p.addChild(name: "J")
p.addChild(name: "N")

var arr = ["Q", "R", "S", "T"]
print(p.depthFirstSearch(array: &arr))

