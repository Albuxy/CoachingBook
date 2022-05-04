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

let trainingData: [Training] = [
    Training(title: "Training Session 1",
             date: "30/05/2022",
             playersAssisting: playersData,
             playersNonAssisting: [],
             importanceLevel: "",
             objectsNeeded: ["object_cone_title" : "3"]),
    Training(title: "Training Session 2",
             date: "24/06/2022",
             playersAssisting: playersData,
             playersNonAssisting: []),
    Training(title: "Training Session 3",
             date: "31/06/2022",
             playersAssisting: playersData,
             playersNonAssisting: [],
             importanceLevel: ""),
    Training(title: "Training Session 4",
             date: "03/07/2022",
             playersAssisting: playersData,
             playersNonAssisting: []),
    Training(title: "Training Session 5",
             date: "12/07/2022",
             playersAssisting: playersData,
             playersNonAssisting: [],
             importanceLevel: "")
]
