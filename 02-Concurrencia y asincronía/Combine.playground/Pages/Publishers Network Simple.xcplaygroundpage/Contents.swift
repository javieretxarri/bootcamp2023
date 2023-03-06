import Combine
import UIKit

var subscribers = Set<AnyCancellable>()

URLSession.shared
    .dataTaskPublisher(for: urlJSON)
    .sink { completion in
        switch completion {
        case .finished:
            print("Se bajaron los dataos")
        case .failure(let error):
            print("Error \(error)")
        }
    } receiveValue: { data, _ in
        do {
            let empleados = try JSONDecoder().decode([Empleado].self, from: data)
            print(empleados.first!)
        } catch {
            print("Error en el JSON \(error)")
        }

    }.store(in: &subscribers)

URLSession.shared
    .dataTaskPublisher(for: urlJSON)
    .map(\.data) // { $0.data}
    .decode(type: [Empleado].self, decoder: JSONDecoder())
    .sink { completion in
        switch completion {
        case .finished:
            print("Se bajaron los dataos")
        case .failure(let error):
            print("Error \(error)")
        }
    } receiveValue: { empleados in
        print(empleados.first!)
    }.store(in: &subscribers)

URLSession.shared
    .dataTaskPublisher(for: urlJSON)
    .map(\.data) // { $0.data}
    .decode(type: [Empleado].self, decoder: JSONDecoder())
    .compactMap(\.first)
    .sink { completion in
        switch completion {
        case .finished:
            print("Se bajaron los dataos")
        case .failure(let error):
            print("Error \(error)")
        }
    } receiveValue: { empleado in
        print(empleado)
    }.store(in: &subscribers)
