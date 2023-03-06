import Combine
import Foundation

// Publishers
// Subscribers
// Operators

// Publishers --> Operators --> Subscribers
//
// Define: <Success, Error> -> <Int, Error>
// No hay Errores: <Successs, Never>

final class SeVienenCositas {
    var subscribers = Set<AnyCancellable>()

    func publisher(array: [Int]) {
        let arrayPublisher = array.publisher
            .map { "\($0)€" }
            .collect(4) // <-- esto hace que las señales no se emitan hasta que llegue a 4

        // let subscribe =
        arrayPublisher.sink { completion in
            //    switch completion {
            //    case .finished:
            //        <#code#>
            //    }
            if case .finished = completion {
                print("Acabo la emision")
            }
        } receiveValue: { num in
            print(num)
        }.store(in: &subscribers)
    }
}

// Dejo de escuchar
// subscribe.cancel()

let cositas1 = SeVienenCositas()
cositas1.publisher(array: [1, 2, 3, 4, 5, 6, 7, 8, 9])
