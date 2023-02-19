import UIKit

let pics = ["Alias", "Alien", "Aliens", "AmazingStories", "AmericanTail", "BasicInstinct", "BoysFromBrazil"]

// elimina los dentro de los opcionales eliminando los nil
// le hace un if let a cada elemento
let images2WithoutNils = pics.compactMap {
    UIImage(named: "\($0).jpg")
}

images2WithoutNils

let i3 = images2WithoutNils[3]
images2WithoutNils.contains(i3)

// Con que uno lo cumpla suficiente
images2WithoutNils.contains { image in
    image.size.width == 200
}

let r = images2WithoutNils.contains(where: { image in image.size.width == 200 })
r
