//
//  CoachModel.swift
//  CoachingBook
//
//  Created by Alba Torra Di Capua on 23/4/22.
//

import Foundation
import SwiftUI

//Model for Trainings
struct Coach: Identifiable {
    var id = UUID()
    var surname: String
    var full_name: String
    var imageString: String
    var dateOfBirth: Date
    var gender: String
    var mobileNumber: String
    var email: String
    var contacts: [Contact] = contactsData
    var teams: [Team]
}

class CoachListModel: ObservableObject {
  @Published var coachList = coachData
}

var coachData: Coach {
    Coach(surname: "Torra",
          full_name: "Alba",
          imageString: "ic_women",
          dateOfBirth: Date(),
          gender: "Women",
          mobileNumber: "753627674",
          email: "alba.torra@gmail.com",
          teams: teamsData)
}
