//
//  Model.swift
//  Unit4Assessment
//
//  Created by Jaheed Haynes on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation

//struct Card: Codable & Equatable {
//   let id: String
//    let cardTitle: String
//    let facts: [String]
//}

struct Card: Codable & Equatable {
    let quizTitle: String
    let facts: [String]
}
