import UIKit

func getData<JSON: Codable>(url: URL,
                            type: JSON.Type,
                            callback: @escaping ((Result<JSON, NetworkError>) -> Void))
{
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data, let res = response as? HTTPURLResponse else {
            if let error {
                callback(.failure(.general(error)))
            }
            return
        }
        if res.statusCode == 200 {
            do {
                let json = try JSONDecoder().decode(JSON.self, from: data)
                callback(.success(json))
            } catch {
                callback(.failure(.json(error)))
            }
        } else {
            callback(.failure(.status(res.statusCode)))
        }
    }.resume()
}

getData(url: urlJSON, type: [Empleado].self) { result in
    switch result {
    case .success(let empleados):
        print(empleados.first!)
    case .failure(let error):
        print("Error \(error.description)")
    }
}

// getData(url: urlJSON, type: [Empleado].self) { (result: Result<JSON, NetworkError>) in
//    switch result {
//    case .success(let empleados):
//        print(empleados.first!)
//    case .failure(let error):
//        print("Error \(error.description)")
//    }
// }
