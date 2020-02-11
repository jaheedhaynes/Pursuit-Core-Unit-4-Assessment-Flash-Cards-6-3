//
//  SearchView.swift
//  Unit4Assessment
//
//  Created by Jaheed Haynes on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class SearchView: UIView {

    lazy var searchCardsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 200)
        layout.sectionInset = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
        layout.scrollDirection = .vertical
        
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
    
    func collectionViewConstraints() {
        
        addSubview(searchCardsCollectionView)
        searchCardsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        searchCardsCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
        searchCardsCollectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor),
        searchCardsCollectionView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
        
        
    }
  
}
