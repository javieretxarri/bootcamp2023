import Foundation

struct Movies {
    let user: String
    let movie: String
    let rating: Int
}

let file = Bundle.main.url(forResource: "MoviesCSV", withExtension: "csv")!

func readMovieesCSV(url: URL) async throws -> [Movies] {
    var movies: [Movies] = []

    //                      es la cabecera, por eso la elimino
    for try await line in url.lines.dropFirst() {
        let components = line.components(separatedBy: ",")
        let movie = Movies(user: components[0], movie: components[1], rating: Int(components[2]) ?? 0)
        movies.append(movie)
    }

    return movies
}

Task {
    let movies = try await readMovieesCSV(url: file)
    for movie in movies {
        print(movie)
    }
}
