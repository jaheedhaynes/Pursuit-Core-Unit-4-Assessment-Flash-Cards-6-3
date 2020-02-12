//
//  SearchView.swift
//  Unit4Assessment
//
//  Created by Jaheed Haynes on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class SearchCardsView: UIView {
    
    public var searchCardCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100, height: 100)
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return collectionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    
    private func commonInit() {
        collectionViewConstraints()
    }
    
//------------------------------------------------------------------------------------------------
// MARK: CONSTRAINTS
    
    private func collectionViewConstraints() {
        addSubview(searchCardCollectionView)
        searchCardCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchCardCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchCardCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            searchCardCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchCardCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }

}
