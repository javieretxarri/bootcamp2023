import UIKit

let url = URL(string: "https://www.themoviedb.org/t/p/w440_and_h660_face/osYbtvqjMUhEXgkuFJOsRYVpq6N.jpg")!

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

getImage(url: url) { image in
    print(image)
    image
}
