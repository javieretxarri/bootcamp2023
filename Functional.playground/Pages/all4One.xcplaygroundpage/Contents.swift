import UIKit

let pics = ["Jaws", "Alias", "Alien", "Aliens", "AmazingStories", "AmericanTail", "BasicInstinct", "BoysFromBrazil"]
let array = [1, 2, 3, 4, 5, 6, 7, 78, 8, 9, 5, 4]

let c1 = Set(array)
    .filter { $0 <= 7 }
    .sorted { $0 < $1 }
    .map { "\($0)€" }
    .reduce("") { "\($0),\($1)" }
    .dropFirst()
