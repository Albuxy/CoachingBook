//
//  TrainingModel.swift
//  CoachingBook
//
//  Created by Alba Torra Di Capua on 22/4/22.
//

import Foundation
import SwiftUI

//Model for Trainings
struct Training: Identifiable {
    var id = UUID()
    var title: String
    var date: String
    var playersAssisting: [Player]
    var playersNonAssisting: [Player]
    var importanceLevel: String = ""
    var imageSession = "Training_session"
    var objectsNeeded: [String : String]?
}
