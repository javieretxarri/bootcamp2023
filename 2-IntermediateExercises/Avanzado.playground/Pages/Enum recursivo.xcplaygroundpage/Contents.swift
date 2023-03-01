import Foundation

//: ![Tree](tree.png)

indirect enum Tree {
    case empty
    case node(Tree, Int, Tree)
}

let n4: Tree = .node(.empty, 4, .empty)
let n7: Tree = .node(.empty, 7, .empty)
let n13: Tree = .node(.empty, 13, .empty)

let n1: Tree = .node(.empty, 1, .empty)
let n6: Tree = .node(n4, 6, n7)
let n14: Tree = .node(n13, 14, .empty)

let n3: Tree = .node(n1, 3, n6)
let n10: Tree = .node(.empty, 10, n14)

let n8: Tree = .node(n3, 8, n10)

func contiene(node: Tree, dato: Int) -> Bool {
    guard case let .node(i, num, d) = node else { return false }

    return dato == num ? true : contiene(node: i, dato: dato) ? true : contiene(node: d, dato: dato)
}

contiene(node: n8, dato: 7)

enum Resultado<Int, String> {
    case ok(Int)
    case peto(String)
}

func paco() -> Resultado<Int, String> {
//    .ok(200)
    .peto("kaske")
}
