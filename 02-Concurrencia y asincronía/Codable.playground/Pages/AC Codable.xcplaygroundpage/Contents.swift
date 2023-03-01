import Foundation

extension DateFormatter {
    static let formatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss" // "2021-02-05T17:40:55"
        return df
    }()
}

struct AppleCoding: Codable {
    let id: Int
    let date: Date

    enum Status: String, Codable {
        case publish, future, draft, pending, privates = "private"
    }

    let status: Status
    let type: String
    let link: URL

    struct Rendered: Codable {
        let rendered: String
    }

    let title: Rendered
    let content: Rendered
    let excerpt: Rendered
    let author: Int
    let categories: [Int]
    let tags: [Int]

    struct Links: Codable {
        let author: [HREF]
        let featuredMedia: [HREF]

        struct HREF: Codable {
            let href: URL
        }

        enum CodingKeys: String, CodingKey {
            case author, featuredMedia = "wp:featuredmedia"
        }
    }

    let links: Links

    enum CodingKeys: String, CodingKey {
        case id, date, status, type, link, title
        case content, excerpt, author, categories, tags
        case links = "_links"
    }
}

let url = Bundle.main.url(forResource: "AppleCoding", withExtension: "json")!
let data = try! Data(contentsOf: url)

let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .formatted(.formatter)

let posts = try! decoder.decode([AppleCoding].self, from: data)
