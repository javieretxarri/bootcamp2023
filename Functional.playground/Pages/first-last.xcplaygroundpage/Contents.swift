import UIKit

let pics = ["Alias", "Alien", "Aliens", "AmazingStories", "AmericanTail", "BasicInstinct", "BoysFromBrazil"]

// elimina los dentro de los opcionales eliminando los nil
// le hace un if let a cada elemento
let images = pics.compactMap {
    UIImage(named: "\($0).jpg")
}

// First empieza desde el principio a buscar
let r1 = images.first
let r12 = images.first {
    $0.size.width == 200
}

// Last empieza de atras para adelante a buscar
let r2 = images.last
let r22 = images.last {
    $0.size.width == 200
}

r2
r22

let image = images[2]
let i1 = images.firstIndex(of: image)
let iN = images.lastIndex(of: image)

let firstIndex = images.firstIndex {
    $0.size.width == 200
}

let lastIndex1 = images.lastIndex {
    $0.size.width == 200
}

