//
//  Model.swift
//  Unit4Assessment
//
//  Created by Jaheed Haynes on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation


struct FlashCard: Codable & Equatable {
    let cardListType: String
    let apiVersion: String
    let cards: [Card]
}


struct Card: Codable & Equatable {
    let id: String
    let cardTitle: String
    let facts: [String]
}
 
/*
//----------------------------------------------------------------------------------------------

extension FlashCard {
    // parse the 'topStoriesTechnology.json" into an array (single array) of [NesHeadline] objects
    static func getCard() -> [Card] {
        var cards = [Card]()
        
        // Bundle() allows access in app resources and files, e.g mp3 file or in our case the topStoriesTecnology.json
        // here we need the url to the topStoriesTechnology.json file
        guard let fileURL = Bundle.main.url(forResource: "facts", withExtension: "json")
            else {
                fatalError("could not locate json file")
        }
        // get the data from the contents of the fileURL
        
        do {
            let data = try Data(contentsOf: fileURL)
            
            // Parse data to our Swift [NewHeadline]
            
            let cardData = try JSONDecoder().decode(FlashCard.self, from: data)
            cards = cardData.cards
        } catch {
            fatalError("failed to load contents \(error)")
        }
        
        
        return cards
    }
}
*/
