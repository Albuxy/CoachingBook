//
//  TeamModel.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 3/5/22.
//

import Foundation

struct Team: Identifiable, Equatable {
    static func == (lhs: Team, rhs: Team) -> Bool {
        return lhs.name == rhs.name
    }
    
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

class TeamListModel: ObservableObject {
  @Published var teamsList = teamsData
    
  var daysWeek: [String] = ["monday_title".localized(LocalizationService.shared.language),
                          "tuesday_title".localized(LocalizationService.shared.language),
                          "wednesday_title".localized(LocalizationService.shared.language),
                          "thursday_title".localized(LocalizationService.shared.language),
                          "friday_title".localized(LocalizationService.shared.language)]

  var dayWeekend: [String] = ["friday_title".localized(LocalizationService.shared.language),
                              "saturday_title".localized(LocalizationService.shared.language),
                              "sunday_title".localized(LocalizationService.shared.language)]
    
  func addItem(item: Team){
    teamsList.append(item)
  }

  func getDayFromString(day: String) -> Day {
    if day == "monday_title".localized(LocalizationService.shared.language) {
          return .monday
      } else if day == "tuesday_title".localized(LocalizationService.shared.language) {
          return .tuesday
      } else if day == "wednesday_title".localized(LocalizationService.shared.language) {
          return .wednesday
      } else if day == "thursday_title".localized(LocalizationService.shared.language) {
          return .thursday
      } else if day == "friday_title".localized(LocalizationService.shared.language) {
          return .friday
      } else if day == "saturday_title".localized(LocalizationService.shared.language) {
          return .saturday
      } else {
          return .sunday
      }
  }
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
         logoString: "ic_example_team2",
         category: "Junior Fem",
         players: playersNotAssistData,
         trainingDays: [Session(day: .tuesday, hour: "18:00"),
                        Session(day: .friday, hour: "19:00")],
         matchDay: Session(day: .sunday, hour: "18:00"))
]
