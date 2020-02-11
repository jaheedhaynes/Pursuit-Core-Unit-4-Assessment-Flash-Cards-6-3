//
//  SearchViewController.swift
//  Unit4Assessment
//
//  Created by Jaheed Haynes on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class SearchViewController: UIViewController {
    
    public var dataPersistence: DataPersistence<FlashCard>!
    
    var searchCardView = SearchView()
    
    var searchInfo = [FlashCard]() {
        didSet {
            DispatchQueue.main.async {
                self.searchCardView.searchCardsCollectionView.reloadData()
            }
        }
    }
    
    var titleForSegueCards = ""
    var factsFromOnlineData = [String]()
    var onlineId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9969699979, green: 0.5268434286, blue: 0.6515719891, alpha: 1)
        searchCardView.searchCardsCollectionView.dataSource = self
        searchCardView.searchCardsCollectionView.delegate = self
        searchCardView.searchCardsCollectionView.register(SearchCell.self, forCellWithReuseIdentifier: "searchCell")

        
    }
    
    override func loadView() {
        view = searchCardView
    }
    
    func fetchCards() {
       
    }

 

}

extension SearchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchInfo.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = searchCardView.searchCardsCollectionView.dequeueReusableCell(withReuseIdentifier: "searchCell", for: indexPath) as? SearchCell else { return UICollectionViewCell() }
        
        let cellInfo = searchInfo[indexPath.row]
        cell.backgroundColor = .white
        
//        cell.searchCardTopicLabel.text = cellInfo.cardTitle
//        cell.addItemButton.tag = indexPath.row
//        cell.addItemButton.addTarget(self, action: #selector(addButtonPressed(_:)), for: .touchUpInside)
//
//        self.titleForSegueCards = cellInfo.cardTitle
//        self.factsFromOnlineData = cellInfo.facts
//        self.onlineId = cellInfo.id
        
        
        return cell
    }
    
    @objc func addButtonPressed(_ sender: UIButton) {
        
        
        //let objectToSave = Card.init(from: <#T##Decoder#>)
        //UserQuizzDataManager.addEntry(quiz: objectToSave)
        
        
        let objectSaved = UIAlertController.init(title: "Quiz was saved", message: nil, preferredStyle: .alert)
        let ok = UIAlertAction.init(title: "Ok", style: .default) { (UIAlertAction) in
            self.dismiss(animated: true, completion: nil)
        }
        objectSaved.addAction(ok)
        present(objectSaved, animated: true, completion: nil)
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let maxSize: CGSize = UIScreen.main.bounds.size

        let itemWidth: CGFloat = maxSize.width

        let itemHeight: CGFloat = maxSize.height * 0.20 // 30%

        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let card = searchInfo[indexPath.row]
        
        
    }
}
