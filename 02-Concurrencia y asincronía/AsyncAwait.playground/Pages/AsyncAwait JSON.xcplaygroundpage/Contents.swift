import Foundation

func getJSON<JSON: Codable>(url: URL, type: JSON.Type) async throws -> JSON {
    do {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse else {
            throw NetworkError.noHTTP
        }
        if response.statusCode == 200 {
            do {
                return try JSONDecoder().decode(JSON.self, from: data)
            } catch {
                throw NetworkError.json(error)
            }
        } else {
            throw NetworkError.status(response.statusCode)
        }
    } catch let error as NetworkError {
        throw error
    } catch {
        throw NetworkError.general(error)
    }
}

Task {
    do {
        let empleado = try await getJSON(url: urlJSON, type: [Empleado].self)
        print(empleado.first!)
    } catch let error as NetworkError {
        print(error.description)

    } catch {
        print("Error \(error)")
    }
}

func getJSON2<JSON: Codable>(url: URL, type: JSON.Type) async throws -> JSON {
    let (data, response) = try await URLSession.shared.dataRequest(from: url)
    guard let response = response as? HTTPURLResponse else {
        throw NetworkError.noHTTP
    }
    if response.statusCode == 200 {
        do {
            return try JSONDecoder().decode(JSON.self, from: data)
        } catch {
            throw NetworkError.json(error)
        }
    } else {
        throw NetworkError.status(response.statusCode)
    }
}

Task {
    do {
        let empleado = try await getJSON2(url: urlJSON, type: [Empleado].self)
        print(empleado.first!)
    } catch let error as NetworkError {
        print(error.description)

    } catch {
        print("Error \(error)")
    }
}
