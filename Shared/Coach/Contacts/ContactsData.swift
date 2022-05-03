//
//  ContactsData.swift
//  CoachingBook (iOS)
//
//  Created by Alba Torra Di Capua on 2/5/22.
//

import Foundation

var contactsData: [Contact] = [
    Contact(full_name: "Josefina Rodriguez",
            gender: .female,
            phoneNumber: "617837472",
            isFavourite: true,
            relation: .mother,
            playerRelated: playersData[0]),
    Contact(full_name: "Rosa Polo",
            gender: .female,
            phoneNumber: "617837472",
            isFavourite: true,
            relation: .mother,
            playerRelated: playersData[2]),
    Contact(full_name: "Manuel Perez",
            gender: .male,
            phoneNumber: "617837472",
            relation: .father,
            playerRelated: playersData[3]),
    Contact(full_name: "Juan Robreño",
            gender: .male,
            phoneNumber: "617837472",
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
