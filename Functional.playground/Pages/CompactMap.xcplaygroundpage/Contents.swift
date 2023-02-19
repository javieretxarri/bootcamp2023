import UIKit

let pics = ["Jaws", "Alias", "Alien", "Aliens", "AmazingStories", "AmericanTail", "BasicInstinct", "BoysFromBrazil"]

let images = pics.map {
    UIImage(named: "\($0).jpg")
}

// elimina los dentro de los opcionales eliminando los nil
// le hace un if let a cada elemento
let images2WithoutNils = pics.compactMap {
    UIImage(named: "\($0).jpg")
}

images2WithoutNils

