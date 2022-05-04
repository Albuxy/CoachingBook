//
//  PlayerModel.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 24/4/22.
//

import Foundation
import SwiftUI

//Model for Player
struct Player: Identifiable {
    var id = UUID()
    var name: String
    var surname: String
    var image: String
    var date: String?
    var gender: String?
    var contactNumber: String?
    var position: String?
    var dorsal: Int?
    var isChecked: Bool = false
}

let playersData: [Player] = [
    Player(name: "Maria",
           surname: "Jolen",
           image: "ic_player"),
    Player(name: "Clara",
           surname: "Suri",
           image: "ic_player"),
    Player(name: "Sofia",
           surname: "Torres",
           image: "ic_player"),
    Player(name: "Laura",
           surname: "Malino",
           image: "ic_player"),
    Player(name: "Natalia",
           surname: "Habas",
           image: "ic_player"),
    Player(name: "Ana",
           surname: "Rodriguez",
           image: "ic_player"),
    Player(name: "Nuria",
           surname: "Polo",
           image: "ic_player")
]

let playersNotAssistData: [Player] = [
    Player(name: "Roberta",
           surname: "Habas",
           image: "ic_player"),
    Player(name: "Julia",
           surname: "Polo",
           image: "ic_player"),
    Player(name: "Maria",
           surname: "Puentes",
           image: "ic_player")
]
