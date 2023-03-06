import Combine
import UIKit

var subscribers = Set<AnyCancellable>()

public let urlJSON2 = URL(string: "https://applecoding.com/testData/EmpleadosData.json")!

func getJSON<JSON: Codable>(url: URL, type: JSON.Type, receiveValue: @escaping (JSON) -> Void) {
    URLSession.shared
        .dataTaskPublisher(for: urlJSON2)
        .mapError { NetworkError.general($0) }
        .tryMap { data, response -> (Data, HTTPURLResponse) in
            guard let res = response as? HTTPURLResponse else {
                throw NetworkError.noHTTP
            }
            return (data, res)
        }
        .tryMap { data, response -> Data in
            if response.statusCode == 200 {
                return data
            } else {
                throw NetworkError.status(response.statusCode)
            }
        }
        .decode(type: JSON.self, decoder: JSONDecoder())
        .mapError { error -> NetworkError in
            if let error = error as? NetworkError {
                return error
            } else {
                return NetworkError.json(error)
            }
        }
//        .compactMap(\.first)
        .receive(on: DispatchQueue.main) // Esto es para que se haga en el hilo principal
        .sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                print("Se bajaron los dataos")
            case .failure(let error):
                print("Error \(error.description)")
            }
        }, receiveValue: receiveValue)
        .store(in: &subscribers)
}

getJSON(url: urlJSON2, type: [Empleado].self) { empleados in
    print(empleados.first!)
}

