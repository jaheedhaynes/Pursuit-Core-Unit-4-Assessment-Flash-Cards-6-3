//
//  Model.swift
//  Unit4Assessment
//
//  Created by Jaheed Haynes on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation


struct Unit4: Codable & Equatable {
    let cardListType: String
    let apiVersion: String
    let cards: [Card]
}


struct Card: Codable & Equatable {
    let id: String
    let cardTitle: String
    let facts: [String]
}
