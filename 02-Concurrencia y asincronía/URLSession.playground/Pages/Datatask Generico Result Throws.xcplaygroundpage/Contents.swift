import UIKit

func getData<Received>(url: URL,
                       builder: @escaping (Data) throws -> Received,
                       callback: @escaping ((Result<Received, NetworkError>) -> Void))
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
                let build = try builder(data)
                callback(.success(build))
            } catch {
                callback(.failure(.json(error)))
            }
        } else {
            callback(.failure(.status(res.statusCode)))
        }
    }.resume()
}

getData(url: urlIMG) { data in
    UIImage(data: data)
} callback: { result in
    switch result {
    case .success(let image):
        if let image {
            image
            print(image)
        }
    case .failure(let error):
        print("Error \(error.description)")
    }
}

getData(url: urlJSON) { data in
    try JSONDecoder().decode([Empleado].self, from: data)
} callback: { result in
    switch result {
    case .success(let empleados):
        print(empleados.first!)
    case .failure(let error):
        print("Error \(error.description)")
    }
}
