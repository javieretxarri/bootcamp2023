import UIKit

let array = [1, 2, 3, 4, 5, 6, 7, 78, 8, 9, 5, 4]
let pics = ["Alias", "Alien", "Aliens", "AmazingStories", "AmericanTail", "BasicInstinct", "BoysFromBrazil"]

let allMayorOrEqualToOne = array.allSatisfy { $0 >= 1 }
allMayorOrEqualToOne

let images = pics.map { UIImage(named: "\($0).jpg") }

let result = images.allSatisfy { $0?.size.width == 100 }
