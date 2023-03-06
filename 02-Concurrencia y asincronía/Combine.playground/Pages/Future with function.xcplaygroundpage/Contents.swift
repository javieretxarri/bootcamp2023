import Combine
import UIKit

public let url = URL(string: "https://www.themoviedb.org/t/p/w440_and_h660_face/osYbtvqjMUhEXgkuFJOsRYVpq6N.jpg")!

func getImageFuture(url: URL) -> Future<UIImage, NetworkError> {
    Future<UIImage, NetworkError> { promise in
        getImage(url: url, promise: promise)
    }
}

func getImage(url: URL, promise: @escaping (Result<UIImage, NetworkError>) -> Void) {
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error {
            promise(.failure(.general(error)))
            return
        }
        guard let data, let response = response as? HTTPURLResponse else {
            promise(.failure(.noHTTP))
            return
        }

        if response.statusCode == 200 {
            if let image = UIImage(data: data) {
                promise(.success(image))
            } else {
                promise(.failure(.dataNotValid))
            }
        } else {
            promise(.failure(.status(response.statusCode)))
        }
    }.resume()
}

let futureIMG = getImageFuture(url: url)

var subscribers = Set<AnyCancellable>()

futureIMG.sink { completion in
    switch completion { case .finished:
        print("Se bajó la image")
    case .failure(let error):
        print("Error \(error.description)")
    }
} receiveValue: { image in
    image
    print(image)
}.store(in: &subscribers)
