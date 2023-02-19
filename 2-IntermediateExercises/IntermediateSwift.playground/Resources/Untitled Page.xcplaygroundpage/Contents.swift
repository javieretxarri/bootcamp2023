import Foundation

let cadena = "Pamplona., Asturias"

let resutl = cadena.replacingOccurrences(of: [".", ","], with: "", options: .literal, range: nil)
resutl
