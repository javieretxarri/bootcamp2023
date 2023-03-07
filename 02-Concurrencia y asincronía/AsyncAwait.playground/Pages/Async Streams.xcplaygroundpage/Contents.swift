import UIKit

let jsonURLMAIN = URL(string: "https://applecoding.com/testData/testImages.json")!

func getData<Received>(url: URL,
                       builder: @escaping (Data) -> Received?,
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
            if let build = builder(data) {
                callback(.success(build))
            } else {
                callback(.failure(.dataNotValid))
            }
        } else {
            callback(.failure(.status(res.statusCode)))
        }
    }.resume()
}

struct Images: Codable {
    let images: [URL]
}

func getRemoteImages(urls: [URL]) -> AsyncThrowingStream<UIImage?, Error> {
    AsyncThrowingStream<UIImage?, Error> { continuation in
        for (index, url) in urls.enumerated() {
            getData(url: url) { data in
                UIImage(data: data)
            } callback: { result in
                // Upcasting para que sea error
                continuation.yield(with: result.mapError { $0 as Error })
                if index == urls.count - 1 {
                    continuation.finish()
                }
            }
        }
    }
}

func getImages(url: URL) async throws -> [UIImage] {
    let (data, _) = try await URLSession.shared.data(from: url)
    let list = try JSONDecoder().decode(Images.self, from: data).images

    var images: [UIImage] = []

    for try await image in getRemoteImages(urls: list).compactMap({ $0 }) {
        images.append(image)
    }

    return images
}

Task {
    let images = try await getImages(url: jsonURLMAIN)
    images
    print(images)
}
