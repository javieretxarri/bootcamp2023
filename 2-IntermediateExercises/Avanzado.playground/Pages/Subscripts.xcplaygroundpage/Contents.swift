import Foundation

let array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
array[2]

final class DiasSemana {
    private let semana = ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"]

    subscript(i: Int) -> String? {
        if i > 0 && i < semana.count {
            return semana[i - 1]
        } else {
            return nil
        }
    }
}

let dias = DiasSemana()
print(dias[2])
if let dia = dias[2] {
    print(dia)
}
