//
//  CardsViewController.swift
//  Unit4Assessment
//
//  Created by Jaheed Haynes on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class UserCardsViewController: UIViewController {
    
    private var mycardsView = UserCardView()
    
    public var dataPersistence: DataPersistence<Card>!
    
    private var myCards = [Card]() {
        didSet {
            mycardsView.collectionView.reloadData()
            if myCards.isEmpty {
                mycardsView.collectionView.backgroundView = EmptyView.init(title: "NO CARDS CREATED", message: "Create a flash card by clicking on 'Create' tab")
            } else {
                mycardsView.collectionView.backgroundView = nil
            }
        }
    }
    
    override func loadView() {
        view = mycardsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mycardsView.collectionView.delegate = self
        mycardsView.collectionView.dataSource = self
        mycardsView.collectionView.register(UserCardCell.self, forCellWithReuseIdentifier: "myCardsCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadUserCards()
    }
    
    func loadUserCards() {
        do {
            myCards = try dataPersistence.loadItems()
        } catch {
            showAlert(title: "ERROR", message: "Could not load cards")
        }
    }
    
}

//-------------------------------------------------------------------------------------------------------
// MARK: EXTENSIONS

extension UserCardsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxsize: CGSize = UIScreen.main.bounds.size
        let itemWidth: CGFloat = maxsize.width * 0.8
        let itemHeight: CGFloat = maxsize.height * 0.30
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
}

extension UserCardsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = mycardsView.collectionView.dequeueReusableCell(withReuseIdentifier: "myCardsCell", for: indexPath) as? UserCardCell else {
            fatalError("could not cast to cell")
        }
        let mycard = myCards[indexPath.row]
        cell.configureCell(for: mycard)
        cell.backgroundColor = .white
        cell.selectedCard = mycard
        cell.delegate = self
        return cell
    }
    
}

extension UserCardsViewController: DataPersistenceDelegate {
    func didSaveItem<T>(_ persistenceHelper: DataPersistence<T>, item: T) where T : Decodable, T : Encodable, T : Equatable {
        loadUserCards()
    }
    
    func didDeleteItem<T>(_ persistenceHelper: DataPersistence<T>, item: T) where T : Decodable, T : Encodable, T : Equatable {
        loadUserCards()
    }
}

extension UserCardsViewController: UserCellDelegate {
    func deleteButtonPressed(cell: UserCardCell, card: Card) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (action) in
            self.deleteCard(card: card)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        present(alertController, animated: true)
    }
    
    private func deleteCard(card: Card) {
        guard let index = myCards.firstIndex(of: card) else {
            return
        }
        do{
            try dataPersistence.deleteItem(at: index)
            showAlert(title: "Deleted", message: "\(card.quizTitle) was deleted")
        }catch {
            showAlert(title: "Error", message: "\(card.quizTitle) could not be deleted")
        }
    }
}

