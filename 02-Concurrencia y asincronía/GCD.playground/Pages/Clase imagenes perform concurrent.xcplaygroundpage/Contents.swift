import UIKit

let jsonURL = URL(string: "https://applecoding.com/testData/testImages.json")!

struct Images: Codable {
    let images: [URL]
}

func getImage(url: URL, callback: @escaping (UIImage) -> Void) {
    URLSession.shared.dataTask(with: url) { data, response, error in

        guard let data, let res = response as? HTTPURLResponse else {
            if let error {
                print("Error de red: \(error)")
            }
            return
        }
        if res.statusCode == 200 {
            if let image = UIImage(data: data) {
                callback(image)
            } else {
                print("Imagen no válida")
            }
        } else {
            print("Error de status \(res.statusCode)")
        }
    }.resume()
}

final class PantallaImages {
    var images: [UIImage] = []
    let jsonURL = URL(string: "https://applecoding.com/testData/testImages.json")!
    let groupImages = DispatchGroup()

    init() {
        getImages(url: jsonURL)
    }

    func getImages(url: URL) {
        let groupJSON = DispatchGroup()
        var urls: [URL] = []

        groupJSON.enter()
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data else { return }
            urls = (try? JSONDecoder().decode(Images.self, from: data).images) ?? []
            groupJSON.leave()
        }.resume()

        groupJSON.wait()

        DispatchQueue.concurrentPerform(iterations: urls.count) { index in
            getImage(url: urls[index]) { image in
                self.images.append(image)
            }
        }
    }
}

let imagesClass = PantallaImages()
imagesClass

sleep(5)
imagesClass.images
