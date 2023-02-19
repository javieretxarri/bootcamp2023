import Foundation

func fibonacci(_ n: Int) -> Double {
    n < 2 ? Double(n) : fibonacci(n - 1) + fibonacci(n - 2)
}

/*
 1: 4 -> 3 2
 2: 3 -> 2 1
 3: 2 -> 1 0
 4: 2 -> 1 0
 5: 3 -> 2 1
 6: 2 -> 1 0
 7: 2 -> 1 0
 8: 1 -> 1
 9: 0 -> 0
 */

fibonacci(1)

var cache: [Int: Double] = [:]

func fibonacciMM(_ n: Int) -> Double {
    if let resultCache = cache[n] { return resultCache }
    let result = n < 2 ? Double(n) : fibonacciMM(n - 1) + fibonacciMM(n - 2)
    cache[n] = result
    return result
}

fibonacciMM(400)
