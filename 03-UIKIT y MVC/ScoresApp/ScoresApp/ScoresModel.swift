//
//  ScoresModel.swift
//  ScoresApp
//
//  Created by Javier Etxarri on 13/3/23.
//

import Foundation

struct Score: Hashable, Codable {
    let id: Int
    let title: String
    let composer: String
    let year: Int
    let length: Double
    let cover: String
    let tracks: [String]
}

// enum Composer: String, Codable {
//    case jamesHorner = "James Horner"
//    case jerryGoldsmith = "Jerry Goldsmith"
//    case johnWilliams = "John Williams"
//    case michaelGiacchino = "Michael Giacchino"
// }
