import Foundation

class A {
    func f(value: Int = 10) {
        print("A: \(value)")
    }
}

class B: A {
    override func f(value: Int = 100) {
        print("B: \(value)")
    }
}

let b: A = B()
b.f()
