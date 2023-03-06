import UIKit

func getImageSimple(url: URL) async throws -> UIImage? {
    do {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse else {
            throw NetworkError.noHTTP
        }
        if response.statusCode == 200 {
            return UIImage(data: data)
        } else {
            throw NetworkError.status(response.statusCode)
        }
    } catch let error as NetworkError {
        throw error
    } catch {
        throw NetworkError.general(error)
    }
}

// extension URLSession {
//    func dataRequest(from: URL) async throws -> (Data, URLResponse) {
//        do {
//            return try await data(from: from)
//        } catch {
//            throw NetworkError.general(error)
//        }
//    }
// }

func getImageSimple2(url: URL) async throws -> UIImage? {
    let (data, response) = try await URLSession.shared.dataRequest(from: url)
    guard let response = response as? HTTPURLResponse else {
        throw NetworkError.noHTTP
    }
    if response.statusCode == 200 {
        return UIImage(data: data)
    } else {
        throw NetworkError.status(response.statusCode)
    }
}

// Es una mala práctica dejar el try sin gestionar porque se queda en el Task com tipo throws
Task {
    do {
        let image = try await getImageSimple2(url: urlIMG)
        if let image {
            image
        }
    } catch let error as NetworkError {
        print(error.description)

    } catch {
        print("Error \(error)")
    }
}

Task {
    let task = Task {
        try await getImageSimple2(url: urlIMG)
    }

    switch await task.result { // Aquí recupero con result
    case .success(let image):
        if let image {
            print(image)
            image
        }
    case .failure(let error as NetworkError):
        print("Error \(error.description)")
    case .failure(let error):
        print("Error \(error)")
    }

    do {
        if let image = try await task.value { // Aquí recupero con value
            image
            print(image)
        }
    } catch let error as NetworkError {
        print(error.description)

    } catch {
        print("Error \(error)")
    }
}

// task.cancel()

// Esto hace que no siempre tenga que recoger su valor
@discardableResult func paco() -> String {
    return ""
}

paco()
