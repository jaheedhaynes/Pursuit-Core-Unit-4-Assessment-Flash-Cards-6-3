//
//  SearchCell.swift
//  Unit4Assessment
//
//  Created by Jaheed Haynes on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
protocol AddButtonDelegate: AnyObject {
    func addCardButton()
}

class SearchCell: UICollectionViewCell {
    
    var delegate: AddButtonDelegate?
    
    lazy var searchCardTopicLabel: UILabel = {
        let label = UILabel()
        label.text = "Topic"
        label.textAlignment = .center
        label.numberOfLines = 3
        return label
    }()
    
    lazy var addItemButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "add-icon-filled"), for: .normal)
        button.addTarget(self, action: #selector(addCardButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    
    @objc func addCardButtonPressed(){
        delegate?.addCardButton()
    }
    
    
    override init(frame: CGRect) {
        super .init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        
    }
    
    private func searchCardConstraints() {
        addSubview(searchCardTopicLabel)
        searchCardTopicLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchCardTopicLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            searchCardTopicLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            searchCardTopicLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            searchCardTopicLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        ])
        
    }
    
    private func setupAddButton() {
        addSubview(addItemButton)
        addItemButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addItemButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            addItemButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11)
        ])
        
    }
    
}
