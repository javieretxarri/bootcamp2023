import Foundation

func buscarSubcadena(cadena: String, sub: String) -> Int? {
    guard !cadena.isEmpty, !sub.isEmpty, let rango = cadena.range(of: sub) else {
        return nil
    }

    return cadena.distance(from: cadena.startIndex, to: rango.lowerBound)
}

let cadena = "Space, the final frontier. There are the voyages of the starship Enterprise"
buscarSubcadena(cadena: cadena, sub: "starship")
buscarSubcadena(cadena: cadena, sub: "utasdd")
buscarSubcadena(cadena: cadena, sub: "")
buscarSubcadena(cadena: "", sub: "starship")

enum Test: Error {
    case hapetao
}

// Marcar el throws y el error es un ENUM
func testError() throws -> Int {
    throw Test.hapetao
}

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

func buscarSubcadenaOk(cadena: String, sub: String) throws -> Int {
    if cadena.isEmpty && sub.isEmpty {
        throw ErroresCadena.cadenaYSubVacia
    }

    if cadena.isEmpty {
        throw ErroresCadena.cadenaVacia
    }

    if sub.isEmpty {
        throw ErroresCadena.subCadenaVacia
    }

    guard let rango = cadena.range(of: sub) else {
        throw ErroresCadena.noExisteSub(sub)
    }

    return cadena.distance(from: cadena.startIndex, to: rango.lowerBound)
}

do {
    let pos1 = try buscarSubcadenaOk(cadena: cadena, sub: "starship")
    //    let pos2 = try buscarSubcadenaOk(cadena: cadena, sub: "utasdd")
    //    let pos3 = try buscarSubcadenaOk(cadena: cadena, sub: "")
    //  let pos4 = try buscarSubcadenaOk(cadena: "", sub: "starship")
    //    let pos5 = try buscarSubcadenaOk(cadena: "", sub: "")
} catch ErroresCadena.cadenaVacia {
    print("majo cadena vacía")
} catch ErroresCadena.subCadenaVacia {
    print("majo sub cadena vacía")
} catch ErroresCadena.cadenaYSubVacia {
    print("majo no ha metido nada")
} catch ErroresCadena.noExisteSub {
    print("se siente, la sub no está dentro de la cadena")
} catch {
    print("Error desconocido \(error)")
}

do {
    let pos1 = try buscarSubcadenaOk(cadena: cadena, sub: "starship")
    let pos2 = try buscarSubcadenaOk(cadena: cadena, sub: "utasdd")
//    let pos3 = try buscarSubcadenaOk(cadena: cadena, sub: "")
//    let pos4 = try buscarSubcadenaOk(cadena: "", sub: "starship")
//    let pos5 = try buscarSubcadenaOk(cadena: "", sub: "")
} catch let error as ErroresCadena {
    print(error.description)
}
