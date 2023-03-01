import UIKit

// Esto lo guarda directamente a fichero
func downloadImage(url: URL, saveUrl: URL) {
    URLSession.shared.downloadTask(with: url) { tempUrl, response, error in
        guard let tempUrl, let res = response as? HTTPURLResponse else {
            if let error {
                print("Error de red: \(error)")
            }
            return
        }
        if res.statusCode == 200 {
            try? FileManager.default.moveItem(at: tempUrl, to: saveUrl)
        } else {
            print("Error de status \(res.statusCode)")
        }
    }.resume()
}

let doc = URL.documentsDirectory.appending(path: "nowayhome.jpg")
print(doc)
downloadImage(url: urlIMG, saveUrl: doc)

sleep(1)
do {
    let data = try Data(contentsOf: doc)
    if let image = UIImage(data: data) {
        image
        print(image)
    }
} catch {}
