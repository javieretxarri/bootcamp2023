import Combine
import Foundation

func asyncIncrement(value: Int, after: TimeInterval, callback: @escaping (Result<Int, Never>) -> ()) {
    Timer.scheduledTimer(withTimeInterval: after, repeats: false) { _ in
        callback(.success(value + 1))
    }
}

asyncIncrement(value: 1, after: 2) { result in
    if case .success(let value) = result {
        print("Soy callback \(value)")
    }
}

func asyncIncrement2(value: Int, after: TimeInterval) -> Future<Int, Never> {
    Future<Int, Never> { promise in
        Timer.scheduledTimer(withTimeInterval: after, repeats: false) { _ in
            promise(.success(value + 1))
        }
    }
}

let future = asyncIncrement2(value: 1, after: 2)

let subs = future.sink { num in
    print("Soy el futuro \(num)")
}
