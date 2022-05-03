//
//  ContactModel.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 2/5/22.
//

import Foundation

//Model for Trainings
struct Contact: Identifiable {
    var id = UUID()
    var full_name: String
    var gender: Gender
    var image: String?
    var phoneNumber: String
    var adress: String?
    var city: String?
    var email: String?
    var isFavourite: Bool = false
    var relation: RelationTypeWithContact
    var playerRelated: Player
}

enum Gender {
    case male
    case female
    case other
}

enum RelationTypeWithContact {
    case father
    case mother
    case other
}
