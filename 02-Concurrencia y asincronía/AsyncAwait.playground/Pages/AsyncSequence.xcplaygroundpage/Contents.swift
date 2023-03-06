import Foundation

var array = [2, 5, 7, 6, 5, 8, 7, 5, 3, 5, 4, 6]

var iterator = array.makeIterator()

while let value = iterator.next() {
    print(value)
}

// AsyncIteratorProtocol

struct AsyncTypeWriterIterator: AsyncIteratorProtocol {
    typealias Element = String

    let message: String
    var index: String.Index

    init(_ message: String) {
        self.message = message
        self.index = message.startIndex
    }

    mutating func next() async throws -> String? {
        guard index < message.endIndex else { return nil }
        try await Task.sleep(for: .seconds(0.5))
        defer { index = message.index(after: index) }
        return String(message[message.startIndex ... index])
    }
}

struct AsyncTypeWriter: AsyncSequence {
    typealias Element = String
    typealias AsyncIterator = AsyncTypeWriterIterator

    let message: String

    func makeAsyncIterator() -> AsyncTypeWriterIterator {
        AsyncTypeWriterIterator(message)
    }
}

Task {
    let texto = AsyncTypeWriter(message: "pamlona es la caña por lo que no te atrevas a meterte con ella")

    for try await txt in texto {
        print(txt)
    }
}
