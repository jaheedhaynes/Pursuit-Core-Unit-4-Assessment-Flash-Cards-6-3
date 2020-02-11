//
//  ViewController.swift
//  Unit4Assessment
//
//  Created by Alex Paul on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class TabBarController: UITabBarController {
    
    private var dataPersistance = DataPersistence<Card>(filename: "card.plist")
    
    private lazy var cardVC: CardViewController = {
        let viewController = CardViewController()
        viewController.tabBarItem = UITabBarItem(title: "Cards", image: UIImage(systemName: "eyeglasses"), tag: 0)
        viewController.dataPersistence = dataPersistance
        return viewController
    }()
    
    private lazy var createVC: CreateViewController = {
        let viewController = CreateViewController()
        viewController.dataPersistence = dataPersistance
        
       
        viewController.dataPersistence.delegate = viewController as? DataPersistenceDelegate
        viewController.tabBarItem = UITabBarItem(title: "Create", image: UIImage(systemName: "folder"), tag: 1)
        return viewController
    }()
    
    private lazy var searchVC: SearchViewController = {
        let viewController = SearchViewController()
        viewController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "gear"), tag: 2)
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [UINavigationController(rootViewController: cardVC), UINavigationController(rootViewController: createVC), UINavigationController(rootViewController: searchVC)]
    }
}

