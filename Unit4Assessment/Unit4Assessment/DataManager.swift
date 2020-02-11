//
//  DataManager.swift
//  Unit4Assessment
//
//  Created by Jaheed Haynes on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation

class DataPersistenceManager {
    private init() {}
    
    static func documentsDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    static func filepathToDocumentsDiretory(filename: String) -> URL {
        return documentsDirectory().appendingPathComponent(filename)
    }
}
