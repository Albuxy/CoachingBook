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
    var date: String
    var contactNumber: String?
    var position: Position
    var dorsal: Int
    var isChecked: Bool = false
    
    func getStringForPosition(currentPosition: Position) -> String {
        switch currentPosition {
        case .base:
            return "position_base".localized(LocalizationService.shared.language)
        case .escolta:
            return "position_escolta".localized(LocalizationService.shared.language)
        case .alero:
            return "position_alero".localized(LocalizationService.shared.language)
        case .alapivot:
            return "position_alapivot".localized(LocalizationService.shared.language)
        case .pivot:
            return "position_pivot".localized(LocalizationService.shared.language)
        }
    }

    func getColorForPosition(currentPosition: Position) -> Color {
        switch currentPosition {
        case .base:
            return Color("baseColor")
        case .escolta:
            return Color("escoltaColor")
        case .alero:
            return Color("aleroColor")
        case .alapivot:
            return Color("alapivotColor")
        case .pivot:
            return Color("pivotColor")
        }
    }
}

let playersData: [Player] = [
    Player(name: "Maria",
           surname: "Jolen",
           image: "ic_player",
           date: "11-08-2001",
           position: .base,
           dorsal: 2),
    Player(name: "Clara",
           surname: "Suri",
           image: "ic_player",
           date: "11-08-2001",
           position: .pivot,
           dorsal: 3),
    Player(name: "Sofia",
           surname: "Torres",
           image: "ic_player",
           date: "11-08-2001",
           position: .alero,
           dorsal: 4),
    Player(name: "Laura",
           surname: "Malino",
           image: "ic_player",
           date: "11-08-2001",
           position: .escolta,
           dorsal: 6),
    Player(name: "Natalia",
           surname: "Habas",
           image: "ic_player",
           date: "11-08-2001",
           position: .alapivot,
           dorsal: 7),
    Player(name: "Ana",
           surname: "Rodriguez",
           image: "ic_player",
           date: "11-08-2001",
           position: .pivot,
           dorsal: 8),
    Player(name: "Nuria",
           surname: "Polo",
           image: "ic_player",
           date: "11-08-2001",
           position: .base,
           dorsal: 9)
]

let playersNotAssistData: [Player] = [
    Player(name: "Roberta",
           surname: "Habas",
           image: "ic_player",
           date: "11-08-2001",
           position: .base,
           dorsal: 16),
    Player(name: "Julia",
           surname: "Polo",
           image: "ic_player",
           date: "11-08-2001",
           position: .base,
           dorsal: 16),
    Player(name: "Maria",
           surname: "Puentes",
           image: "ic_player",
           date: "11-08-2001",
           position: .base,
           dorsal: 16)
]

enum Position {
    case base, pivot, alero, escolta, alapivot
}
