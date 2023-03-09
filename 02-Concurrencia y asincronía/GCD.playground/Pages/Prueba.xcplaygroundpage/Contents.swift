import Foundation

class Program {
    func bubbleSort(array: inout [Int], _ counter: Int = 0) -> [Int] {
        var changes = 0
        for i in 0 ..< array.count - 1 - counter {
            if array[i + 1] < array[i] {
                let aux = array[i]
                array[i] = array[i + 1]
                array[i + 1] = aux
                changes += 1
            }
        }

        return changes != 0 ? bubbleSort(array: &array, counter + 1) : array
    }
}

let program = Program()
var arrayToSort = [8, 5, 2, 9, 5, 6, 3]
program.bubbleSort(array: &arrayToSort)
