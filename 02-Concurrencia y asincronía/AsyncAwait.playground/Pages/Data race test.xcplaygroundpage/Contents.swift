import Foundation

class Valores2 {
    var value: Int

    init(value: Int) {
        self.value = value
    }
}

let group = DispatchGroup()

let valor1bis = Valores2(value: 0)
let valor2bis = valor1bis

DispatchQueue.global().async(group: group) {
    valor1bis.value += 10
    valor2bis.value += 20
}

DispatchQueue.global().async(group: group) {
    valor2bis.value += 20
}

sleep(2)
print(valor2bis.value)
