import Foundation

class Valores {
    var value: Int

    init(value: Int) {
        self.value = value
    }
}

let valor1 = Valores(value: 0)
let valor2 = valor1

valor2.value += 1
valor1.value += 2

print(valor1.value)
print(valor2.value)

struct ValoresS {
    var value: Int

    init(value: Int) {
        self.value = value
    }
}

var valor1S = ValoresS(value: 0)
var valor2S = valor1S

valor2S.value = 1
valor1S.value = 2

print(valor1S.value)
print(valor2S.value)

actor ValoresSafe {
    var value: Int

    init(value: Int) {
        self.value = value
    }

    func increment() -> Int {
        value += 1
        return value
    }
}

let valorSafe1 = ValoresSafe(value: 0)

Task {
    await valorSafe1.increment()
    print("-----------------------")
    print(await valorSafe1.value)
}

Task {
    await valorSafe1.increment()
    print(await valorSafe1.value)
}

class ValoresSafe2 {
    var value: Int

    init(value: Int) {
        self.value = value
    }

    func increment() async -> Int {
        value += 1
        return value
    }
}

let valorSafe2 = ValoresSafe2(value: 0)

Task {
    await valorSafe2.increment()
    print("-----------------------")
    print(valorSafe2.value)
}

Task {
    await valorSafe2.increment()
    print(valorSafe2.value)
}
