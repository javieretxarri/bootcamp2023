import Foundation

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

func getDataAsync<JSON: Codable>(url: URL, type: JSON.Type) async throws -> JSON {
    try await withCheckedThrowingContinuation { continuation in
        getData(url: url, type: type.self) { result in
            continuation.resume(with: result)
        }
    }
}

Task {
    do {
        let empleado = try await getDataAsync(url: urlJSON, type: [Empleado].self)
        print(empleado.first!)
    } catch let error as NetworkError {
        print(error.description)

    } catch {
        print("Error \(error)")
    }
}
