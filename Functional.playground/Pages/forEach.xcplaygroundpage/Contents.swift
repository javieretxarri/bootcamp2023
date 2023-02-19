import Foundation

let array = [1, 2, 3, 4, 5, 6, 7, 78, 8, 9, 5, 4]

array.forEach { num in
    print(num)
}

array.forEach { num in
    if num % 2 == 0 {
        print(num)
    }
}
