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

func getImages(url: URL) -> [UIImage] {
    let groupJSON = DispatchGroup()
    var urls: [URL] = []

    groupJSON.enter()
    getData(url: url) { data in
        try? JSONDecoder().decode(Images.self, from: data)
    } callback: { images in
        urls = images.images
        groupJSON.leave()
    }

    groupJSON.wait()

    let concurrent = DispatchQueue(label: "com.acacademy.concurrent", attributes: .concurrent)
    let groupImages = DispatchGroup()
    var images: [UIImage] = []

    var i = 0
    for url in urls {
        print(" starting to download image number \(i) with url \(url)")
        i += 1
        groupImages.enter()
        concurrent.async {
            getData(url: url) { data in
                print("Receiving data from url \(url)")
                return UIImage(data: data)
            } callback: { image in
                images.append(image)
                groupImages.leave()
            }
        }
    }

    groupImages.wait()

    return images
}

// DispatchQueue.global().async {
let images = getImages(url: jsonURL)
print(images)
images
// }
