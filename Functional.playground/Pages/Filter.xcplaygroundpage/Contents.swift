import UIKit

let array = [1, 2, 3, 4, 5, 6, 7, 78, 8, 9, 5, 4]
let pics = ["Alias", "Alien", "Aliens", "AmazingStories", "AmericanTail", "BasicInstinct", "BoysFromBrazil"]

let filterResult = array.filter { $0 > 5 }
filterResult

let images = pics.map { UIImage(named: "\($0).jpg") }

let images100 = images.filter { image in
    // optional chaining
    image?.size.width == 100
}

images100
