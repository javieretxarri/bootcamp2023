import UIKit

func getImage(url: URL) async throws -> UIImage {
    sleep(1)
    print("3")
    let (data, _) = try await URLSession.shared.data(from: url)
    return UIImage(data: data)!
}

print("0")
Task {
    let image = try await getImage(url: urlIMG)
    image
    print("2")
}

print("1")

func getImageSimple(url: URL) async throws -> UIImage? {
    let (data, _) = try await URLSession.shared.data(from: url)
    return UIImage(data: data)!
}

// Es una mala práctica dejar el try sin gestionar porque se queda en el Task com tipo throws
Task {
    let image = try await getImageSimple(url: urlIMG)
    if let image {
        image
    }
}
