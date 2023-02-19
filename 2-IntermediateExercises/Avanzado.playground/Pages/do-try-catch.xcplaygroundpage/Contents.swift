import Foundation

func getCosa(filename: String) -> String? {
    guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
        return nil
    }
    do {
        let data = try Data(contentsOf: url)
        return String(data: data, encoding: .utf8)
    } catch {
        print(error.localizedDescription)
        return nil
    }
}

getCosa(filename: "EmpleadosData")

/*
 Schema domain     / path
 https://google.com/uta
 file://           /home/Users/javieretxarri
 */

func getCosa2(filename: String) -> String? {
    guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
        return nil
    }
    if let data = try? Data(contentsOf: url) {
        return String(data: data, encoding: .utf8)
    }
    return nil
}

getCosa2(filename: "EmpleadosData")

func getCosaProhibida(filename: String) -> String? {
    guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
        return nil
    }
    let data = try! Data(contentsOf: url)
    // let data = try! Data(contentsOf: URL(string: "file////lasdkf.es"))
    return String(data: data, encoding: .utf8)
}

getCosaProhibida(filename: "EmpleadosData")
