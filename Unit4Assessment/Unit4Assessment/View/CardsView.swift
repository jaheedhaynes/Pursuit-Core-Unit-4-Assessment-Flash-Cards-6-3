//
//  CardsView.swift
//  Unit4Assessment
//
//  Created by Jaheed Haynes on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class CardsView: UIView {

    public lazy var cardCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 250, height: 250)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 8, bottom: 20, right: 8)
        let collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = #colorLiteral(red: 0.9633663297, green: 0.8417919278, blue: 0.7775592804, alpha: 1)
        return collectionView
    }()

    override init(frame: CGRect) {
        super .init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        collectionViewConstraints()
    }
    
    private func collectionViewConstraints() {
        addSubview(cardCollectionView)
        
        cardCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cardCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            cardCollectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor),
            cardCollectionView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor)
        ])
    }

}
