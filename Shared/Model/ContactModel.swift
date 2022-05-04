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

var contactsData: [Contact] = [
    Contact(full_name: "Josefina Rodriguez",
            gender: .female,
            phoneNumber: "617837472",
            city: "San Francisco",
            email: "josefinro@yopmail.com",
            isFavourite: true,
            relation: .mother,
            playerRelated: playersData[0]),
    Contact(full_name: "Rosa Polo",
            gender: .female,
            phoneNumber: "935925923",
            city: "Barcelona",
            email: "fsarasf@yopmail.com",
            isFavourite: true,
            relation: .mother,
            playerRelated: playersData[2]),
    Contact(full_name: "Manuel Perez",
            gender: .male,
            phoneNumber: "75375732",
            city: "Paris",
            email: "sgasgsagsa@yopmail.com",
            relation: .father,
            playerRelated: playersData[3]),
    Contact(full_name: "Juan Robreño",
            gender: .male,
            phoneNumber: "617837472",
            city: "Los Angeles",
            email: "juanelo2@yopmail.com",
            relation: .father,
            playerRelated: playersData[1]),
    Contact(full_name: "Pol Canelo",
            gender: .male,
            phoneNumber: "617837472",
            isFavourite: true,
            relation: .father,
            playerRelated: playersData[4]),
    Contact(full_name: "Cristina Aguirre",
            gender: .female,
            phoneNumber: "617837472",
            isFavourite: true,
            relation: .other,
            playerRelated: playersData[5]),
    Contact(full_name: "Mariana Felipe",
            gender: .female,
            phoneNumber: "617837472",
            relation: .mother,
            playerRelated: playersData[5])
]
