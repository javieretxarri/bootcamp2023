import UIKit

// func getImage(url: URL, callback: @escaping (UIImage) -> Void) {
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
//            if let image = UIImage(data: data) {
//                callback(image)
//            } else {
//                print("Imagen no válida")
//            }

            if let build = builder(data) {
                callback(build)
            }

//            do {
//                let empleados = try JSONDecoder().decode(Received.self, from: data)
//                callback(empleados)
//            } catch {
//                print("Error en el JSON \(error)")
//            }

        } else {
            print("Error de status \(res.statusCode)")
        }
    }.resume()
}

getData(url: urlIMG) { data in
    UIImage(data: data)
} callback: { image in
    print(image)
    image
}

getData(url: urlJSON) { data in
    try? JSONDecoder().decode([Empleado].self, from: data)
} callback: { empleados in
    print(empleados.first!)
}
