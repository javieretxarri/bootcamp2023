import Foundation

private func buclePrime(i: Int, number: Int) -> Bool {
    if i * i <= number {
        if number % i == 0 || number % (i + 2) == 0 {
            return false
        }
        return buclePrime(i: i + 6, number: number)
    }

    return true
}

public func isPrime(number: Int) -> Bool {
    guard number > 0 else { return false }

    if number <= 3 {
        return true
    }

    if number % 2 == 0 || number % 3 == 0 {
        return false
    }
    return buclePrime(i: 5, number: number)
}

public func sum(numbers: [Int]) -> Int? {
    guard numbers.count > 0 else { return nil }
    var sum = 0
    for value in numbers {
        sum += value
    }
    return sum
}
