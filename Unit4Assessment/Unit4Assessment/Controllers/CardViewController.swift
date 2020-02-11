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

    public var dataPersistence: DataPersistence<FlashCard>!
    
    private var savedCreatedCard = CreateView()
    
    private var createdCard = [FlashCard]() {
        didSet {
            //
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemTeal
    }
    



}
