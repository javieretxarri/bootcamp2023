import UIKit

public let urlJSON = URL(string: "https://applecoding.com/testData/EmpleadosData.json")!
public let urlIMG = URL(string: "https://www.themoviedb.org/t/p/w440_and_h660_face/osYbtvqjMUhEXgkuFJOsRYVpq6N.jpg")!

public enum NetworkError: Error {
    case general(Error)
    case status(Int)
    case json(Error)
    case dataNotValid
    case unknown

    public var description: String {
        switch self {
        case .general(let error):
            return "Error general \(error.localizedDescription)"
        case .status(let int):
            return "Error status: \(int)"
        case .json(let error):
            return "Error json: \(error)"
        case .dataNotValid:
            return "Error not valid"
        case .unknown:
            return "Error unknown"
        }
    }
}

// MARK: - Empleado

public struct Empleado: Codable {
    let id: Int
    let username, firstName, lastName: String
    let gender: Gender
    let email: String
    let department: Department
    let address: String
    let avatar: String
    let zipcode: String?

    enum CodingKeys: String, CodingKey {
        case id, username
        case firstName = "first_name"
        case lastName = "last_name"
        case gender, email, department, address, avatar, zipcode
    }
}

public enum Department: String, Codable {
    case accounting = "Accounting"
    case businessDevelopment = "Business Development"
    case engineering = "Engineering"
    case humanResources = "Human Resources"
    case legal = "Legal"
    case marketing = "Marketing"
    case productManagement = "Product Management"
    case researchAndDevelopment = "Research and Development"
    case sales = "Sales"
    case services = "Services"
    case support = "Support"
    case training = "Training"
}

public enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
}
