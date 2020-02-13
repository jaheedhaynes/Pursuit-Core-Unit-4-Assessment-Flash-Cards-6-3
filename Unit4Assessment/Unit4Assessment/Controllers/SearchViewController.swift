//
//  SearchViewController.swift
//  Unit4Assessment
//
//  Created by Jaheed Haynes on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class SearchCardsViewController: UIViewController {
    
    private let searchView = SearchCardsView()
    
    public var dataPersistence: DataPersistence<Card>!
    
    override func loadView() {
        view = searchView
    }
    
    public var currentCards = [Card]() {
        didSet {
            DispatchQueue.main.async {
                self.searchView.searchCardCollectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getLocalCards()
        searchView.searchCardCollectionView.delegate = self
        searchView.searchCardCollectionView.dataSource = self
        searchView.searchCardCollectionView.register(SearchCell.self, forCellWithReuseIdentifier: "searchCell")
    }
    
    
    private func getCards() {
        CardsAPIClient.getCards { [weak self] (result) in
            switch result {
            case .failure(let appError):
                print("error getting data \(appError)")
            case .success(let cards):
                self?.currentCards = cards
            }
        }
    }
    
    
    private func getLocalCards() {
        do {
            currentCards = try FlashCardService.getlocalJSONData()
        } catch {
            print("could not get data")
            showAlert(title: "NO DATA", message: "No Cards were found. Check API")
        }
    }
}



//---------------------------------------------------------------------------------------------------
// MARK: EXTENSIONS

extension SearchCardsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxsize: CGSize = UIScreen.main.bounds.size
        let itemWidth: CGFloat = maxsize.width * 0.8
        let itemHeight: CGFloat = maxsize.height * 0.30
        return CGSize(width: itemWidth, height: itemHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
}


extension SearchCardsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let searchCardCell = searchView.searchCardCollectionView.dequeueReusableCell(withReuseIdentifier: "searchCell", for: indexPath) as? SearchCell else {
            
            fatalError("could not downcast to cell")
        }
        
        let card = currentCards[indexPath.row]
        
        searchCardCell.configureCell(for: card)
        
        searchCardCell.delegate = self
        
        searchCardCell.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        searchCardCell.selectedCard = card
        
        return searchCardCell
    }
    
}


extension SearchCardsViewController: SaveUserCreateCardDelegate {
    
    func didCreateCard(card: Card) {
        if dataPersistence.hasItemBeenSaved(card) {
            showAlert(title: "\(card.quizTitle) has already been saved", message: "ERROR")
            return
        }
        do {
            try dataPersistence.createItem(card)
            showAlert(title: "Card Added", message: "\(card.quizTitle) Saved")
        } catch {
            showAlert(title: "Failed to Save \(card.quizTitle)", message: "Unable to save error: \(error)")
        }
    }
}
