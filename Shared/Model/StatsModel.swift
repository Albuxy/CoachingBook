//
//  StatsModel.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 8/5/22.
//

import Foundation

enum TypeStat{
    case attendance, punctuality, behaviour, attitude
}

//Model for general stats
struct Stats: Identifiable {
    var id = UUID()
    var type: TypeStat
    var percTotal: Float
}

var statsGeneralData: [Stats] = [
    Stats(type: .attendance,
          percTotal: 0.34),
    Stats(type: .punctuality,
          percTotal: 0.87),
    Stats(type: .behaviour,
          percTotal: 0.4828),
    Stats(type: .attitude,
          percTotal: 0.6423)
]

//Model for Attendance
struct AttendanceStats: Identifiable {
    var id = UUID()
    var percMatchTotal: Float
    var percTrainingTotal: Float
    var injuriesMatch: Int
    var injuriesTraining: Int
    var otherMatch: Int
    var otherTraining: Int
}

var attendanceStatData = AttendanceStats(percMatchTotal: 0.61,
                                         percTrainingTotal: 0.34,
                                         injuriesMatch: 1,
                                         injuriesTraining: 3,
                                         otherMatch: 5,
                                         otherTraining: 0)

//Model for Punctuality
struct PunctualityStats: Identifiable {
    var id = UUID()
    var percMatchTotal: Float
    var percTrainingTotal: Float
    var LowMatch: Int
    var MediumMatch: Int
    var HighMatch: Int
    var LowTraining: Int
    var MediumTraining: Int
    var HighTraining: Int
}


var punctualityStatData = PunctualityStats(percMatchTotal: 0.12,
                                           percTrainingTotal: 0.74,
                                           LowMatch: 1,
                                           MediumMatch: 3,
                                           HighMatch: 5,
                                           LowTraining: 2,
                                           MediumTraining: 4,
                                           HighTraining: 8)

//Model for Behaviour
struct BehaviourStats: Identifiable {
    var id = UUID()
    var mediaBehaviour: Int
    var mediaAttitude: Int
    var puntuateTotalBehaviour: Int
    var puntuateTotalAttitude: Int
}

var behaviourStatData = BehaviourStats(mediaBehaviour: 4,
                                       mediaAttitude: 7,
                                       puntuateTotalBehaviour: 9,
                                       puntuateTotalAttitude: 4
)
