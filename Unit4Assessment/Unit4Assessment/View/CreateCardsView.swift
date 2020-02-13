//
//  CreateView.swift
//  Unit4Assessment
//
//  Created by Jaheed Haynes on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class CreateCardsView: UIView {
    
    weak var delegate: SaveUserCreateCardDelegate?
    
    public lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Subject"
        textField.backgroundColor = #colorLiteral(red: 0.9257643819, green: 0.9567708373, blue: 1, alpha: 1)
        return textField
    }()
    
    
    public lazy var factOneTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.isSelectable = true
        textView.isEditable = true
        textView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return textView
    }()
    
    
    public lazy var factTwoTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.isEditable = true
        textView.isSelectable = true
        textView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return textView
    }()
    
    
    public lazy var createCardButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create Card", for: .normal)
        button.addTarget(self, action: #selector(saveButtonPressed(_:)), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        resignFirstResponder()
        return button
    }()
    
    
    public lazy var createCardAlert: UILabel = {
        let label = UILabel()
        label.text = "☠️ NO CARD FOR YOU ☠️"
        label.textAlignment = .center
        label.textColor = .systemRed
        label.alpha = 0
        return label
    }()
    
    
    //----------------------------------------------------------------
    // MARK: OBJC METHODS
    
    @objc private func saveButtonPressed(_ sender: UIButton) {
        if titleTextField.text?.isEmpty ?? true || factOneTextView.text.isEmpty || factTwoTextView.text.isEmpty {
            sender.isEnabled = false
            UIView.transition(with: self, duration: 1.0, options: [.transitionFlipFromLeft], animations: {
                self.createCardAlert.alpha = 1.0
            }, completion: nil)
        } else {
            sender.isEnabled = true
            
            let newCreatedCard = Card(quizTitle: titleTextField.text ?? "Pursuit", facts: [factOneTextView.text, factTwoTextView.text])
            
            delegate?.didCreateCard(card: newCreatedCard)
            
            createCardAlert.alpha = 0
            
            resignFirstResponder()
        }
        
        sender.isEnabled = true
    }
    
    //----------------------------------------------------------------
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    private func commonInit() {
        titleTextFieldConstraints()
        factOneTextFieldConstraints()
        factTwoTextFieldConstraints()
        createCardButtonConstraints()
        alertConstraints()
    }
    
    //------------------------------------------------------------------------------------------------
    // MARK: CONSTRAINTS
    
    private func titleTextFieldConstraints() {
        addSubview(titleTextField)
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            titleTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            titleTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    
    private func factOneTextFieldConstraints() {
        addSubview(factOneTextView)
        factOneTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            factOneTextView.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 10),
            factOneTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            factOneTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            factOneTextView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func factTwoTextFieldConstraints() {
        addSubview(factTwoTextView)
        factTwoTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            factTwoTextView.topAnchor.constraint(equalTo: factOneTextView.bottomAnchor, constant: 10),
            factTwoTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            factTwoTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            factTwoTextView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func createCardButtonConstraints() {
        addSubview(createCardButton)
        createCardButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            createCardButton.topAnchor.constraint(equalTo: factTwoTextView.bottomAnchor, constant: 10),
            createCardButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            createCardButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            createCardButton.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    private func alertConstraints() {
        addSubview(createCardAlert)
        createCardAlert.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            createCardAlert.topAnchor.constraint(equalTo: createCardButton.bottomAnchor, constant: 10),
            createCardAlert.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            createCardAlert.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40)
        ])
    }
}
