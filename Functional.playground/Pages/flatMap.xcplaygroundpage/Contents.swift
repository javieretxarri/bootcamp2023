import Foundation

let array = [1, 2, 3, 4, 5, 6, 7, 78, 8, 9, 5, 4]
let array2 = [[1, 2, 3], [4, 5, 6], [7, 78, 8], [9, 5, 4]]

let n1 = array2.flatMap { num in
    num
}

let n2 = array2.flatMap {
    $0
}

let n3 = array2.flatMap { num in
    [num.reduce(0) { $0 + $1 }]
}
