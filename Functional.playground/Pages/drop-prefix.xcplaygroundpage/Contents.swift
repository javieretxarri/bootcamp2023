import UIKit

let array = [1, 2, 3, 4, 5, 6, 7, 78, 8, 9, 5, 4]

let r1 = array.dropLast(4)
let r2 = array.dropFirst(2)

let r3 = array.drop(while: { num in
    num < 8
})

let r4 = array.prefix(4)
let r5 = array.prefix(upTo: 5)
let r6 = array.prefix(through: 6)
let r7 = array.prefix { num in
    num < 8
}

r7

