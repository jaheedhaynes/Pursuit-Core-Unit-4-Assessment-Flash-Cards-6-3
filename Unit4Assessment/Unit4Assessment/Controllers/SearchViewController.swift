//
//  SearchViewController.swift
//  Unit4Assessment
//
//  Created by Jaheed Haynes on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class SearchViewController: UIViewController {
    
    public var dataPersistence: DataPersistence<Card>!
    
    var searchCardView = SearchView()
    
    var searchInfo = [Card]() {
        didSet {
            DispatchQueue.main.async {
                self.searchCardView.searchCardsCollectionView.reloadData()
            }
        }
    }
    
    var titleForSegueCards = ""
    var factsFromOnlineData = [String]()
    var onlineId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9969699979, green: 0.5268434286, blue: 0.6515719891, alpha: 1)
        
        
    }
    
    override func loadView() {
        view = searchCardView
    }
    

 

}
