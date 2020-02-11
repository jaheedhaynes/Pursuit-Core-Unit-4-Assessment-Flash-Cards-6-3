//
//  CardCell.swift
//  Unit4Assessment
//
//  Created by Jaheed Haynes on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

protocol DeleteItemButtonDelegate: AnyObject {
    func moreActionsButtonPressed()
}

class QuizzCell: UICollectionViewCell {
    
    var delegate: DeleteItemButtonDelegate?
    
    lazy var cardTopicLabel: UILabel = {
        let label = UILabel()
        label.text = "Topic goes here"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var deleteItemButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "more-filled"), for: .normal)
        button.addTarget(self, action: #selector(deleteItemButtonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func deleteItemButtonPressed() {
        delegate?.moreActionsButtonPressed()
    }
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        
    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
           setupQuizzTopic()
           setupDeleteButton()
           
       }
    
    private func setupQuizzTopic() {
        addSubview(cardTopicLabel)
        cardTopicLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        cardTopicLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
        cardTopicLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
        cardTopicLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11),
        cardTopicLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11)
        ])
        
    }
    
    private func setupDeleteButton() {
        addSubview(deleteItemButton)
        deleteItemButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        deleteItemButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
        deleteItemButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11)
        ])
    }
}
