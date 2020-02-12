//
//  CreateViewController.swift
//  Unit4Assessment
//
//  Created by Jaheed Haynes on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

protocol SaveUserCreateCardDelegate: AnyObject {
    func didCreateCard(card: Card)
}

class CreateCardsViewController: UIViewController {

    private let createCardView = CreateCardsView()
    
    public var dataPersistence: DataPersistence<Card>!
    
    private lazy var tapGesture: UITapGestureRecognizer = {
       let gesture = UITapGestureRecognizer()
        gesture.addTarget(self, action: #selector(didTap(_:)))
        gesture.numberOfTapsRequired = 1
        return gesture
    }()
    
    
    override func loadView() {
        view = createCardView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        createCardView.titleTextField.delegate = self
        createCardView.factOneTextView.delegate = self
        createCardView.factTwoTextView.delegate = self
        createCardView.delegate = self
        createCardView.addGestureRecognizer(tapGesture)
    }
    
//----------------------------------------
// MARK: OBJC ACTION METHOD
    
    @objc private func didTap(_ gesture: UITapGestureRecognizer) {
        createCardView.titleTextField.resignFirstResponder()
        createCardView.factTwoTextView.resignFirstResponder()
        createCardView.factOneTextView.resignFirstResponder()
    }

}

//-------------------------------------------------------------------------------------------------------
// MARK: EXTENSIONS

extension CreateCardsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


extension CreateCardsViewController: UITextViewDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
}


extension CreateCardsViewController: SaveUserCreateCardDelegate {
    func didCreateCard(card: Card) {
        do {
            try dataPersistence.createItem(card)
            showAlert(title: "\(card.quizTitle) Saved", message: "")
        } catch {
            showAlert(title: "\(card.quizTitle) could not be saved", message: "unable to save \(error)")
        }
    }
    
}

