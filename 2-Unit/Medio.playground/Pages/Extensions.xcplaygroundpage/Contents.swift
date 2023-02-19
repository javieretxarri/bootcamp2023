import Foundation

func getSubstring(cadena: String, inicio: Int, final: Int) -> String? {
    guard !cadena.isEmpty, inicio >= 0, final < cadena.count, final > inicio else { return nil }
    let initIndex = cadena.index(cadena.startIndex, offsetBy: inicio)
    let finalIndex = cadena.index(cadena.startIndex, offsetBy: final)
    return String(cadena[initIndex ... finalIndex])
}

if let pamplonaSubstring = getSubstring(cadena: "Pamplona", inicio: 1, final: 6) {
    print(pamplonaSubstring)
}

extension String {
    func getSubstring(inicio: Int, final: Int) -> String? {
        guard !isEmpty, inicio >= 0, final < count, final > inicio else { return nil }
        let initIndex = index(startIndex, offsetBy: inicio)
        let finalIndex = index(startIndex, offsetBy: final)
        return String(self[initIndex ... finalIndex])
    }

    var palabras: Int {
        components(separatedBy: " ").count
    }
}

if let result = "Pamplona".getSubstring(inicio: 1, final: 6) {
    print(result)
}

"Pamplona es la leche".palabras
