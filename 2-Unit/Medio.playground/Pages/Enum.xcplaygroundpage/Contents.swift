import Foundation
enum GenerosCine: Int {
    case scifi, drama, comedia, infantil, musical, terror, fantasia, anime
}

var genero1 = GenerosCine.terror
var genero2: GenerosCine = .infantil

if genero1 == .terror {
    print("Es el género de terror")
}

if genero2 != .comedia {
    print("Genero2 no es una comedia")
}

switch genero1 {
case .scifi:
    print("Scifi")
case .drama:
    print("Drama")
case .comedia:
    print("Comedia")
case .infantil:
    print("Infantil")
case .musical:
    print("Musical")
case .terror:
    print("Terror")
case .fantasia:
    print("Fantasia")
case .anime:
    print("Anime")
}

// This is possible because we set :Int in the enum
let valor = genero1.rawValue
// Optional return
let newEnum = GenerosCine(rawValue: 5)
let newEnum2 = GenerosCine(rawValue: 35)

if let newEnum {
    print(newEnum)
}

enum Gender: String {
    case male, female
}

var gender1: Gender = .male
gender1.rawValue

enum Errores {
    case general(String)
    case status(Int)
    case json(String)
    case unknow
}

let error1: Errores = .general("Petó y no sabemos el porque")
let error2: Errores = .status(403)

switch error1 {
case .general(let mensaje):
    print("El error ha sido \(mensaje)")
case .status(let num):
    print("El error de status http es \(num)")
case .json(let jsonError):
    print("El error json es  \(jsonError)")
case .unknow:
    print("No sé que ha pasado")
}

if case .status(let num) = error2 {
    print("Error status \(num)")
}

guard case .general(let error) = error1 else { fatalError() }

print("Error general \(error)")

// do {
// } catch (Errores.general) {
// } catch (Errores.status) {
// } catch (Errores.json) {}
