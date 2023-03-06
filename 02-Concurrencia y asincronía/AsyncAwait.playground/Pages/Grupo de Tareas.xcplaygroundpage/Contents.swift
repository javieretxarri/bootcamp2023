import UIKit

let jsonURLMAIN = URL(string: "https://applecoding.com/testData/testImages.json")!

func getImageSimple(url: URL) async throws -> UIImage? {
    let (data, _) = try await URLSession.shared.data(from: url)
    return UIImage(data: data)!
}

struct Images: Codable {
    let images: [URL]
}

// Serialized
func getImage(url: URL) async throws -> [UIImage] {
    var result: [UIImage] = []

    let (data, _) = try await URLSession.shared.data(from: url)
    let list = try JSONDecoder().decode(Images.self, from: data).images

    for url in list {
        if let image = try await getImageSimple(url: url) {
            result.append(image)
        }
    }

    return result
}

Task {
    let images = try await getImage(url: jsonURLMAIN)
    images
}

func getImageConcurrent(url: URL) async throws -> [UIImage] {
    var result: [UIImage] = []

    let (data, _) = try await URLSession.shared.data(from: url)
    let list = try JSONDecoder().decode(Images.self, from: data).images

    try await withThrowingTaskGroup(of: UIImage?.self) { group in
        for url in list {
            group.addTask {
                try await getImageSimple(url: url)
            }
        }

        for try await image in group {
            if let image {
                result.append(image)
            }
        }
    }

    return result
}

Task {
    let images = try await getImageConcurrent(url: jsonURLMAIN)
    images
}

func getImageConcurrentReturning(url: URL) async throws -> [UIImage] {
    let (data, _) = try await URLSession.shared.data(from: url)
    let list = try JSONDecoder().decode(Images.self, from: data).images

    print(list)

    return try await withThrowingTaskGroup(of: UIImage?.self, returning: [UIImage].self) { group in
        for url in list {
            group.addTask {
                try await getImageSimple(url: url)
            }
        }

        var result: [UIImage] = []
        for try await image in group {
            if let image {
                result.append(image)
            }
        }
        return result
    }
}

Task {
    let images = try await getImageConcurrentReturning(url: jsonURLMAIN)
    images
}

func getImageConcurrentReturning2(url: URL) async throws -> [UIImage] {
    let (data, _) = try await URLSession.shared.data(from: url)
    let list = try JSONDecoder().decode(Images.self, from: data).images

    return try await withThrowingTaskGroup(of: UIImage?.self, returning: [UIImage].self) { group in
        for url in list {
            group.addTask {
                try await getImageSimple(url: url)
            }
        }

        var result: [UIImage] = []
        for try await image in group.compactMap({ $0 }) {
            result.append(image)
        }
        return result
    }
}

Task {
    do {
        let images = try await getImageConcurrentReturning2(url: jsonURLMAIN)
        images
    } catch {
        print(error)
    }
}
