//
//  SearchCell.swift
//  Unit4Assessment
//
//  Created by Jaheed Haynes on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class SearchCell: UICollectionViewCell {
    
    weak var delegate: SaveUserCreateCardDelegate?
    
    public var selectedCard: Card?
    
    private var isPressed = false
    
    private lazy var longPressGesture: UILongPressGestureRecognizer = {
       let gesture = UILongPressGestureRecognizer()
        gesture.addTarget(self, action: #selector(longPressed(_:)))
        return gesture
    }()
    
    
    public lazy var addButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.arrow.down"), for: .normal)
        button.addTarget(self, action: #selector(addButtonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    public lazy var cardTitle: UILabel = {
       let label = UILabel()
        label.text = "Flash Card Topic"
        label.numberOfLines = 2
        label.alpha = 1
        return label
    }()
    
    public lazy var answers: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.alpha = 0
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    private func commonInit() {
        buttonConstraints()
        titleConstraints()
        answersConstraints()
        addGestureRecognizer(longPressGesture)
    }

    @objc public func addButtonPressed(_ sender: UIButton) {
        if let card = selectedCard {
            delegate?.didCreateCard(card: card)
        }
    }
    
    @objc private func longPressed(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began || gesture.state == .changed {
            return
        }
        isPressed.toggle()
        animate()
    }
    
    
    private func animate() {
        if isPressed {
            UIView.transition(with: self, duration: 0.75, options: [.transitionFlipFromRight], animations: {
                self.answers.alpha = 1.0
                self.cardTitle.alpha = 0
            }, completion: nil)
        } else {
            UIView.transition(with: self, duration: 0.75, options: [.transitionFlipFromLeft], animations: {
                self.answers.alpha = 0
                self.cardTitle.alpha = 1.0
            }, completion: nil)
        }
    }
    
    public func configureCell(for card: Card) {
        cardTitle.text = card.quizTitle
        answers.text = "\(card.facts.first ?? "") \n\(card.facts.last ?? "")"
    }
//------------------------------------------------------------------------------------------------
// MARK: CONSTRAINTS
    
    private func buttonConstraints() {
        addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: topAnchor),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            addButton.heightAnchor.constraint(equalToConstant: 44),
            addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor)
        ])
    }
    
    private func titleConstraints() {
        addSubview(cardTitle)
        cardTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cardTitle.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 10),
            cardTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cardTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    private func answersConstraints() {
        addSubview(answers)
        answers.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            answers.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            answers.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            answers.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            answers.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    
}
