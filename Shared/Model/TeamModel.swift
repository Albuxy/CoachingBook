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
    var category: String
    var players: [Player]
    var trainingDays: [Session]
    var matchDay: Session
    var trainingEvents: [Training] = trainingData
    var matchEvents: [Match] = matchData
    var generalStats = statsGeneralData
}

struct Session: Identifiable {
    var id = UUID()
    var day: Day
    var hour: String
    
    func getStringsForDay(currentDay: Day) -> String {
        switch currentDay {
        case .monday:
            return "monday_title".localized(LocalizationService.shared.language)
        case .tuesday:
            return "tuesday_title".localized(LocalizationService.shared.language)
        case .wednesday:
            return "wednesday_title".localized(LocalizationService.shared.language)
        case .thursday:
            return "thursday_title".localized(LocalizationService.shared.language)
        case .friday:
            return "friday_title".localized(LocalizationService.shared.language)
        case .saturday:
            return "saturday_title".localized(LocalizationService.shared.language)
        case .sunday:
            return "sunday_title".localized(LocalizationService.shared.language)
        }
    }
}

enum Day {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
}

var teamsData: [Team] = [
    Team(name: "Team 1",
         logoString: "ic_example_team",
         category: "Mini Mixto",
         players: playersData,
         trainingDays: [Session(day: .monday, hour: "18:30"),
                        Session(day: .thursday, hour: "20:30")],
         matchDay: Session(day: .saturday, hour: "17:45")),
    Team(name: "Team 2",
         logoString: "ic_example_team",
         category: "Junior Femenino",
         players: playersNotAssistData,
         trainingDays: [Session(day: .tuesday, hour: "18:00"),
                        Session(day: .friday, hour: "19:00")],
         matchDay: Session(day: .sunday, hour: "18:00"))
]
