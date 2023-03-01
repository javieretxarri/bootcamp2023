import Foundation

enum ErroresCadena: Error {
    case cadenaVacia
    case subCadenaVacia
    case cadenaYSubVacia
    case noExisteSub(String)

    var description: String {
        switch self {
        case .cadenaVacia:
            return "Cadena vacía"
        case .subCadenaVacia:
            return "Subcadena vacía"
        case .cadenaYSubVacia:
            return "Cadena y subcadena vacía"
        case .noExisteSub(let sub):
            return "No existe la subcadena \(sub)"
        }
    }
}

func buscarSub(cadena: String, sub: String) -> Result<Int, ErroresCadena> {
    if cadena.isEmpty && sub.isEmpty {
        return .failure(ErroresCadena.cadenaYSubVacia)
    }

    if cadena.isEmpty {
        return .failure(ErroresCadena.cadenaVacia)
    }

    if sub.isEmpty {
        return .failure(ErroresCadena.subCadenaVacia)
    }

    guard let rango = cadena.range(of: sub) else {
        return .failure(ErroresCadena.noExisteSub(sub))
    }

    let resultado = cadena.distance(from: cadena.startIndex, to: rango.lowerBound)
    return .success(resultado)
}

let cadena = "Space, the final frontier. There are the voyages of the starship Enterprise"
let r1 = buscarSub(cadena: cadena, sub: "starship")
let r2 = buscarSub(cadena: cadena, sub: "utasdd")
let r3 = buscarSub(cadena: cadena, sub: "")
let r4 = buscarSub(cadena: "", sub: "starship")

switch r2 {
case .success(let int):
    print("Está en la posición \(int)")
case .failure(let error):
    print("Ha habido un error \(error.description)")
}

if case .success(let success) = r1 {
    print("Lo ha encotnrado en la posición \(success)")
}

if case .failure(let failure) = r3 {
    print("Error  \(failure.description)")
}

let valor = try? r2.get()
if let valor {
    print(valor)
}

let url = URL(string: "file:///ruta/fichero.json")!
let resultado = Result { try Data(contentsOf: url) }

switch resultado {
case .success(let data):
    print(data.count)
case .failure(let error):
    print(error)
}
