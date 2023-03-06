import UIKit

// struct Empleado: Codable {
//    let id: Int
//    let username, firstName, lastName: String
//    let gender: Gender
//    let email: String
//    let department: Department
//    let address: String
//    let avatar: String
//    let zipcode: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id, username
//        case firstName = "first_name"
//        case lastName = "last_name"
//        case gender, email, department, address, avatar, zipcode
//    }
// }
//
// enum Department: String, Codable {
//    case accounting = "Accounting"
//    case businessDevelopment = "Business Development"
//    case engineering = "Engineering"
//    case humanResources = "Human Resources"
//    case legal = "Legal"
//    case marketing = "Marketing"
//    case productManagement = "Product Management"
//    case researchAndDevelopment = "Research and Development"
//    case sales = "Sales"
//    case services = "Services"
//    case support = "Support"
//    case training = "Training"
// }
//
// public enum Gender: String, Codable {
//    case female = "Female"
//    case male = "Male"
// }

func getData<JSON: Codable>(url: URL,
                            type: JSON.Type,
                            callback: @escaping ((Result<JSON, NetworkError>) -> Void))
{
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data, let res = response as? HTTPURLResponse else {
            if let error {
                callback(.failure(.general(error)))
            }
            return
        }
        if res.statusCode == 200 {
            do {
                let json = try JSONDecoder().decode(JSON.self, from: data)
                callback(.success(json))
            } catch {
                callback(.failure(.json(error)))
            }
        } else {
            callback(.failure(.status(res.statusCode)))
        }
    }.resume()
}

getData(url: urlJSON, type: [Empleado].self) { result in
    switch result {
    case .success(let empleados):
        print(empleados.first!)
    case .failure(let error):
        print("Error \(error.description)")
    }
}

// getData(url: urlJSON, type: [Empleado].self) { (result: Result<JSON, NetworkError>) in
//    switch result {
//    case .success(let empleados):
//        print(empleados.first!)
//    case .failure(let error):
//        print("Error \(error.description)")
//    }
// }
