import UIKit

let pics = ["Jaws", "Alias", "Alien", "Aliens", "AmazingStories", "AmericanTail", "BasicInstinct", "BoysFromBrazil"]

let images = pics.map {
    UIImage(named: "\($0).jpg")
}

let array = [1, 2, 3, 4, 5, 6, 7, 78, 8, 9, 5, 4]

array.sorted {
    $0 > $1
}

let s1 = pics.sorted {
    $0.count < $1.count
}
