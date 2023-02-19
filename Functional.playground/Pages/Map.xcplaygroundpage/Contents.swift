import UIKit

let array = [1, 2, 3, 4, 5, 6, 7, 78, 8, 9, 5, 4]

let mapResult = array.map { $0 + 1 }
mapResult

let mapResult2 = mapResult.map { "\($0)€" }
mapResult2

let mapResult3 = mapResult.map { "\($0 + 2)€" }
mapResult3

let saludos = ["Hola", "Adios", "Hasta luego", "Bienvenido", "Hasta pronto"]

let mapResult4 = saludos.map { $0.uppercased() }
mapResult4

let pics = ["Alias", "Alien", "Aliens", "AmazingStories", "AmericanTail", "BasicInstinct", "BoysFromBrazil"]

let image = UIImage(named: "Alias.jpg")

let images = pics.map { UIImage(named: "\($0).jpg") }
images

let images2 = pics.map { pictureName in
    UIImage(named: "\(pictureName).jpg")
}

images2
