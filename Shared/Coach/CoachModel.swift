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
    //var teams: [Int]
}

var coachData: Coach {
    Coach(surname: "Coach",
          full_name: "name",
          imageString: "ic_women",
          dateOfBirth: Date(),
          gender: "Women",
          mobileNumber: "753627674",
          email: "coachName@gmail.com")
}
