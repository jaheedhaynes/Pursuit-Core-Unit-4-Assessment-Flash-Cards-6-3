//
//  CardsViewController.swift
//  Unit4Assessment
//
//  Created by Jaheed Haynes on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class CardViewController: UIViewController {

    public var dataPersistence: DataPersistence<Card>!
    
    private var savedCreatedCard = CreateView()
    
    private var createdCard = [Card]() {
        didSet {
            //
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemTeal
    }
    



}
