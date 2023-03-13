//
//  ModelLogic.swift
//  ScoresApp
//
//  Created by Javier Etxarri on 13/3/23.
//

import SwiftUI

final class ModelLogic {
    static let shared = ModelLogic()
    let persistence = ModelPersistence.shared

    var scores: [Score]

    init() {
        do {
            self.scores = try persistence.getScores()
        } catch {
            self.scores = []
        }
    }

    func getRows() -> Int {
        scores.count
    }

    func getScoreRow(indexPath: IndexPath) -> Score {
        scores[indexPath.row]
    }

    func deleteScore(indexPath: IndexPath) {
        scores.remove(at: indexPath.row)
    }

    func moveScore(indexPath: IndexPath, to: IndexPath) {
        let index = IndexSet(integer: indexPath.row)
        scores.move(fromOffsets: index, toOffset: to.row)
    }
}
