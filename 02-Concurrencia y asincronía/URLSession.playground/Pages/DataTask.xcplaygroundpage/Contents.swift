import UIKit

let url = URL(string: "https://www.themoviedb.org/t/p/w440_and_h660_face/osYbtvqjMUhEXgkuFJOsRYVpq6N.jpg")!

final class Cargas {
    var image: UIImage?

    func getImage(url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in

            guard let data, let res = response as? HTTPURLResponse else {
                if let error {
                    print("Error de red: \(error)")
                }
                return
            }
            if res.statusCode == 200 {
                self.image = UIImage(data: data)

//                if let image = UIImage(data: data) {
//                    print(image)
//                } else {
//                    print("Imagen no válida")
//                }
            } else {
                print("Error de status \(res.statusCode)")
            }
        }.resume()
    }
}

let cargas = Cargas()
cargas.getImage(url: url)

sleep(1)

cargas.image
