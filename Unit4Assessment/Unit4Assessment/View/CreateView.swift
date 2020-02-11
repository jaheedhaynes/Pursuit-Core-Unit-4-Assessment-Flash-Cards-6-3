//
//  CreateView.swift
//  Unit4Assessment
//
//  Created by Jaheed Haynes on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class CreateView: UIView {
    
    lazy var cardTitleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter question here"
        textField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return textField
    }()
    
    lazy var factOne: UITextView = {
        let textView = UITextView()
        textView.text = "Enter fact here"
        return textView
    }()
    
    lazy var factTwo: UITextView = {
        let textView = UITextView()
        textView.text = "Enter fact here"
        return textView
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
        createCardTitleConstraints()
        firstFactConstraints()
        secondFactConstraint()
    }
    
    
    func createCardTitleConstraints() {
        addSubview(cardTitleTextField)
        cardTitleTextField.translatesAutoresizingMaskIntoConstraints = false
        cardTitleTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 11).isActive = true
        cardTitleTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive = true
        cardTitleTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11).isActive = true
        
        
    }
    
    func firstFactConstraints() {
        addSubview(factOne)
        factOne.translatesAutoresizingMaskIntoConstraints = false
        factOne.topAnchor.constraint(equalTo: cardTitleTextField.bottomAnchor, constant: 11).isActive = true
        factOne.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive = true
        factOne.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11).isActive = true
        factOne.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.30).isActive = true
    }
    
    func secondFactConstraint() {
        addSubview(factTwo)
        factTwo.translatesAutoresizingMaskIntoConstraints = false
        factTwo.topAnchor.constraint(equalTo: factOne.bottomAnchor, constant: 11).isActive = true
        factTwo.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive = true
        factTwo.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11).isActive = true
        factTwo.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.30).isActive = true
    }
    
    
}
