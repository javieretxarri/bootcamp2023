import Foundation

class Program {
    class BST {
        var value: Int
        var left: BST?
        var right: BST?

        init(value: Int) {
            self.value = value
        }
    }

    func branchSums(root: BST) -> [Int] {
        var sums: [Int] = []
        calculateBranchSums(node: root, runningSum: 0, sums: &sums)
        return sums
    }

    func calculateBranchSums(node: BST?, runningSum: Int, sums: inout [Int]) {
        guard let node = node else { return }

        let newRunningSum = runningSum + node.value

        if node.left == nil && node.right == nil {
            sums.append(newRunningSum)
            return
        }

        calculateBranchSums(node: node.left, runningSum: newRunningSum, sums: &sums)
        calculateBranchSums(node: node.right, runningSum: newRunningSum, sums: &sums)
    }
}

let program = Program()
var tree = Program.BST(value: 1)
tree.left = Program.BST(value: 2)
tree.right = Program.BST(value: 3)
tree.left!.left = Program.BST(value: 4)
tree.left!.right = Program.BST(value: 5)
tree.right!.left = Program.BST(value: 6)
tree.right!.right = Program.BST(value: 7)
tree.left!.left!.left = Program.BST(value: 8)
tree.left!.left!.right = Program.BST(value: 9)
tree.left!.right!.left = Program.BST(value: 10)
var expected: [Int] = [15, 16, 18, 10, 11]
var output = program.branchSums(root: tree)
output
