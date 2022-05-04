//
//  MatchMode.swift
//  CoachingBook
//
//  Created by Alba Torra Di Capua on 22/4/22.
//

import Foundation
import SwiftUI

//Model for Trainings
struct Match: Identifiable {
    var id = UUID()
    var title: String
    var date: String
    var imageTeam1: String = "ic_team"
    var imageTeam2: String = "ic_team2"
    var playersAssisting: [Player]
    var playersNonAssisting: [Player]
    var importanceLevel: String = "Medium"
    var numberOfPeriods: Int = 6
    var imageSession = "Match_session"
}

let matchData: [Match] = [
    Match(title: "Match Game 1",
          date: "30/05/2022",
          playersAssisting: playersData,
          playersNonAssisting: [],
          importanceLevel: "Low"),
    Match(title: "Match Game 2",
          date: "24/06/2022",
          playersAssisting: playersData,
          playersNonAssisting: [],
          importanceLevel: "High"),
    Match(title: "Match Game 3",
          date: "31/06/2022",
          playersAssisting: playersData,
          playersNonAssisting: [],
          importanceLevel: "Low"),
    Match(title: "Match Game 4",
          date: "03/07/2022",
          playersAssisting: playersData,
          playersNonAssisting: [],
          importanceLevel: "Medium"),
    Match(title: "Match Game 5",
          date: "12/07/2022",
          playersAssisting: playersData,
          playersNonAssisting: [],
          importanceLevel: "Medium")
]
