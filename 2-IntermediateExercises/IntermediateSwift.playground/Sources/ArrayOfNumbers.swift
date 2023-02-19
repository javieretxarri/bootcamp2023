import Foundation

public func createAnArrayWithN(number: Int, maxValue: Int = 10000) -> [Int] {
    return (0 ..< number).map { _ in Int.random(in: 1 ... maxValue) }
}
