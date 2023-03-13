//
//  ModelPersistence.swift
//  ScoresApp
//
//  Created by Javier Etxarri on 13/3/23.
//

import Foundation

final class ModelPersistence {
    static let shared = ModelPersistence()

    let scoresBundleURL = Bundle.main.url(forResource: "scoresdata", withExtension: "json")!
    let scoresDocuments = URL.documentsDirectory.appending(path: "scoresdata.json")

    func getScores() throws -> [Score] {
        let data = try Data(contentsOf: scoresBundleURL)
        return try JSONDecoder().decode([Score].self, from: data)
    }

    func saveScores(scores: [Score]) throws {
        let data = try JSONEncoder().encode(scores)
        try data.write(to: scoresDocuments, options: .atomic)
    }
}
