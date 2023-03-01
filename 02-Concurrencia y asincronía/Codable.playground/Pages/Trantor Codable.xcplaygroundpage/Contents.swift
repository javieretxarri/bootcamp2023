import Foundation

struct Books: Codable {
    let id = UUID()
    let idChusco: Int
    let title: String
    let author: UUID
    let year: Int
    var cover: URL?
    var isbn: String?
    var plot: String?
    var rating: Double?
    var summary: String?
    var pages: Int?

    var yearString: String {
        "\(year)"
    }

    enum CodingKeys: String, CodingKey {
        case idChusco = "id", title, author, year, cover, isbn, plot, rating, summary, pages
    }
}

let url = Bundle.main.url(forResource: "trantor", withExtension: "json")!

let data = try! Data(contentsOf: url)
let books = try! JSONDecoder().decode([Books].self, from: data)

books.count
