import UIKit

let jsonURL = URL(string: "https://applecoding.com/testData/testImages.json")!

struct Images: Codable {
    let images: [URL]
}

func getData<Received>(url: URL,
                       builder: @escaping (Data) -> Received?,
                       callback: @escaping (Received) -> Void)
{
    URLSession.shared.dataTask(with: url) { data, response, error in

        guard let data, let res = response as? HTTPURLResponse else {
            if let error {
                print("Error de red: \(error)")
            }
            return
        }
        if res.statusCode == 200 {
            if let build = builder(data) {
                callback(build)
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

    func getImages(url _: URL) {
        let groupJSON = DispatchGroup()
        var urls: [URL] = []

        groupJSON.enter()
        getData(url: jsonURL) { data in
            try? JSONDecoder().decode(Images.self, from: data)
        } callback: { images in
            urls = images.images
            groupJSON.leave()
        }

        groupJSON.wait()

//        let concurrent = DispatchQueue(label: "com.acacademy.concurrent", attributes: .concurrent)
        var imagesTMP: [UIImage] = []

//        concurrent.async {
        for url in urls {
            groupImages.enter()
            getData(url: url) { data in
                UIImage(data: data)
            } callback: { image in
//                    DispatchQueue.main.async {
//                        self.images.append(image)
//                    }
                self.images.append(image)
                imagesTMP.append(image)
                print(image)
                self.groupImages.leave()
            }
        }
//        }
        groupImages.notify(queue: .main) {
            print("Aquí estoy")
            print(imagesTMP)
        }
    }
}

let imagesClass = PantallaImages()
imagesClass

sleep(5)
imagesClass.images
