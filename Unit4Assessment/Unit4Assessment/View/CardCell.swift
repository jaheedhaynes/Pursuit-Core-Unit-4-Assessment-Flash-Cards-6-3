//
//  CardCell.swift
//  Unit4Assessment
//
//  Created by Jaheed Haynes on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class CardCell: UICollectionViewCell {
    
    override func layoutSubviews() {
        cardTitleLabel.clipsToBounds = true
        cardTitleLabel.layer.cornerRadius = 18
    }
    
    public lazy var cardTitleLabel: UITextField = {
        let label = UITextField()
        // label.numberOfLines = 2
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.text = "Card Title"
        return label
    }()
    
    public lazy var cardFactabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.text = "Card Title"
        return label
    }()
}

