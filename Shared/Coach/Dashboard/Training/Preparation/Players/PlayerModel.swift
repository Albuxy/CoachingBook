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
