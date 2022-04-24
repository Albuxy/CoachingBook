//
//  ObjectsModel.swift
//  CoachingBook
//
//  Created by Alba Torra Di Capua on 23/4/22.
//

import Foundation
import SwiftUI

//Model for ObjectsNeeded
struct Object: Identifiable {
    var id = UUID()
    var titleObject: String
    var imageObject: String
    var isNeeded = false
    var number_needed: Int
}

let objectsData: [Object] = [
    Object(titleObject: "object_cone_title",
           imageObject: "ic_cone",
           number_needed: 0),
    Object(titleObject: "object_bench_title",
           imageObject: "ic_bench",
           number_needed: 0),
    Object(titleObject: "object_ladder_title",
           imageObject: "ic_ladder",
           number_needed: 0),
    Object(titleObject: "object_ring_title",
           imageObject: "ic_ring",
           number_needed: 0),
    Object(titleObject: "object_tennis_ball_title",
           imageObject: "ic_tennisBall",
           number_needed: 0),
    Object(titleObject: "object_bibs_vest_title",
           imageObject: "ic_bibsVest",
           number_needed: 0),
]
