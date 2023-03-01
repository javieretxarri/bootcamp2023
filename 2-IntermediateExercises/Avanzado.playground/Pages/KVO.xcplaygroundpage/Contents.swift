import Foundation

final class Empleado: NSObject {
    @objc dynamic var salario: Double = 0
    var salary: Double = 0 {
        didSet {
            print("Ha cambiado a salary \(salary)")
        }
    }
}

let empleado1 = Empleado()

empleado1.observe(\.salario, options: [.new, .old]) { _, value in
    print("ha cambiado el valor a \(value.newValue ?? 0)")
}

empleado1.salario = 30000

empleado1.salary = 6900
