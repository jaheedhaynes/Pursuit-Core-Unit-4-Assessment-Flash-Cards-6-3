//
//  LocalAPIClient.swift
//  Unit4Assessment
//
//  Created by Jaheed Haynes on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation

public enum ServiceError: Error {
  case resourcePathDoesNotExist
  case contentsNotFound
  case decodingError(Error)
}

final class FlashCardService {
  public static func getlocalJSONData() throws -> [Card] {
    guard let path = Bundle.main.path(forResource: "FlashCards", ofType: "json") else {
      throw ServiceError.resourcePathDoesNotExist
    }
    guard let json = FileManager.default.contents(atPath: path) else {
      throw ServiceError.contentsNotFound
    }
    do {
      let results = try JSONDecoder().decode([Card].self, from: json)
        return results
    } catch {
      throw ServiceError.decodingError(error)
    }
  }
}
