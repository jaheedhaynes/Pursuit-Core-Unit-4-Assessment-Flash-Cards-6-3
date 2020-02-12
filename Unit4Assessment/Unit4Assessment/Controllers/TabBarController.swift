//
//  ViewController.swift
//  Unit4Assessment
//
//  Created by Alex Paul on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class TabBar: UITabBarController {

   private let dataPersistence = DataPersistence<Card>(filename: "createdCards.plist")
        
        private lazy var userCardsVC: UserCardsViewController = {
            let viewController = UserCardsViewController()
            viewController.tabBarItem = UITabBarItem(title: "Flashcards", image: UIImage(systemName: "mic.fill"), tag: 0)
            viewController.view.backgroundColor = .systemBackground
            viewController.dataPersistence = dataPersistence
            viewController.dataPersistence.delegate = viewController
            return viewController
        }()
    
    
        private lazy var createCardsVC: CreateCardsViewController = {
            let viewController = CreateCardsViewController()
            viewController.tabBarItem = UITabBarItem(title: "Create", image: UIImage(systemName: "mic.fill"), tag: 1)
            viewController.view.backgroundColor = .systemBackground
            viewController.dataPersistence = dataPersistence
            return viewController
        }()
    
    
        private lazy var searchCardsVC: SearchCardsViewController = {
            let viewController = SearchCardsViewController()
            viewController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "mic.fill"), tag: 2)
            viewController.view.backgroundColor = .systemBackground
            viewController.dataPersistence = dataPersistence
            return viewController
        }()
        
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            viewControllers = [userCardsVC, createCardsVC, searchCardsVC]
        }
        
        
    }
