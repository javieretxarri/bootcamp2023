import Foundation

final class MiReloj {
    var timer: Timer!

    init(seconds: TimeInterval) {
        self.timer = Timer.scheduledTimer(withTimeInterval: seconds,
                                          repeats: false) { _ in
            print("Ya ha terminado")
        }
    }
}

let miReloj = MiReloj(seconds: 0.1)

var arrayFuera: [() -> ()] = []
// array.append {
//    print("Hola")
// }

class Test {
    var x = 10
    var timer: Timer!

    var array: [() -> ()] = []
//    array.append {
//        print("Hola")
//    }

    func callback(completion: () -> ()) {
        completion()
    }

    func callbackTimer(seconds: TimeInterval, completion: @escaping () -> ()) {
        timer = Timer.scheduledTimer(withTimeInterval: seconds,
                                     repeats: false) { _ in
            completion()
            print("Ya ha terminado adsfd")
            print(self.x)
        }
    }

    func callbackArray(completion: @escaping () -> ()) {
        array.append(completion)
    }

    func callbackArrayFueraNonSafe(completion: @escaping () -> ()) {
        arrayFuera.append(completion)
    }

    func test() {
        callback {
            x = 20
        }

//        callbackArray {
//            print("Ola k ase!!")
//        }

        callbackArray { [weak self] in
            print("Ola k ase 2!!")
            self?.x = 15
            print("ya lo entiendo \(self?.x ?? 0)")
        }

        callbackArray { [unowned self] in
            self.x = 15
            print("ya lo entiendo 3 \(x)")
        }

        callbackArrayFueraNonSafe { [weak self] in
            self?.x = 15
            print("ya lo entiendo 2 \(self?.x ?? 0)")
        }

//        callbackTimer(seconds: 1) { [weak self] in // [unowned self] <- esto está mal. No convierte a self en opcional
//            self?.x = 40
//        }
    }
}

do {
    let test = Test() // ARC =  1
    do {
        let test2 = test // ARC = 2
        test2.x
    } // ARC = 1
    print(test.x)
    test.test()
    print(test.x)
    print(test.x)
    test.array.first?()
    test.array[1]()
}

arrayFuera.first?()
// array.last?()
// array.last?()
// Automatic reference counting ARC
