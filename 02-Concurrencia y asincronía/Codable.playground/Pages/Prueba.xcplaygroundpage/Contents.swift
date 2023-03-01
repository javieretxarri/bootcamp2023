import Foundation

var formatter: DateFormatter = {
    var formatter = DateFormatter()
    formatter.dateFormat = "E dd-MM-yyyy HH:mm"
//    formatter.timeZone = .current
    return formatter
}()

let resultPrev = formatter.date(from: "Thu 23-02-2023 11:05")

if let result = formatter.date(from: "Thu 23-02-2023 11:05") {
    let date = result.description(with: .current)
    print(date)
}
