import UIKit

// URLSession.shared.
let configuration = URLSessionConfiguration.default
configuration.timeoutIntervalForRequest = 30
let session = URLSession(configuration: configuration)

URLSession.shared

let url = URL(string: "https://www.themoviedb.org/t/p/w440_and_h660_face/osYbtvqjMUhEXgkuFJOsRYVpq6N.jpg")!

url.scheme
url.host
url.path()
url.port
url.lastPathComponent

var request = URLRequest(url: url)
request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
request.addValue("application/json", forHTTPHeaderField: "Accept")
request.addValue("Bearer kasdfonwfok323232okasdf", forHTTPHeaderField: "Authorization")
request.httpMethod = "POST"
request.httpBody = "hola".data(using: .utf8)

URLSession.shared.dataTask(with: url).resume()

// POSTMAN
var requestPostman = URLRequest(url: URL(string: "https://www.themoviedb.org/t/p/w440_and_h660_face/osYbtvqjMUhEXgkuFJOsRYVpq6N.jpg")!, timeoutInterval: Double.infinity)
requestPostman.httpMethod = "GET"

let task = URLSession.shared.dataTask(with: requestPostman) { data, _, error in
    guard let data = data else {
        print(String(describing: error))
        return
    }
    print(String(data: data, encoding: .utf8)!)
}

task.resume()
