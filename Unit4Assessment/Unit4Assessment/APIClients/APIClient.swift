//
//  APIClient.swift
//  Unit4Assessment
//
//  Created by Jaheed Haynes on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation
import NetworkHelper

struct CardsAPIClient {
    static func getCards(completion: @escaping (Result<[Card], AppError>) -> ()) {
        
        let endpointURL = "https://5daf8b36f2946f001481d81c.mockapi.io/api/v2/cards"
        
        guard let url = URL(string: endpointURL) else {
            completion(.failure(.badURL(endpointURL)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let networkError):
                completion(.failure(.networkClientError(networkError)))
            case .success(let data):
                do {
                    let results = try JSONDecoder().decode([Card].self, from: data)
                    completion(.success(results))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
    
}
