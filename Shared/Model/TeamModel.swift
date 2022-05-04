//
//  TeamModel.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 3/5/22.
//

import Foundation

struct Team: Identifiable {
    var id = UUID()
    var name: String
    var logoString: String
    var players: [Player]
}

var teamsData: [Team] = [
    Team(name: "Team 1",
         logoString: "",
         players: playersData),
    Team(name: "Team 2",
         logoString: "",
         players: playersNotAssistData)
]
