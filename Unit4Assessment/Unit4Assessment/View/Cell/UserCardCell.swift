//
//  CardCell.swift
//  Unit4Assessment
//
//  Created by Jaheed Haynes on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

protocol UserCellDelegate: AnyObject {
    func deleteButtonPressed(cell: UserCardCell, card: Card)
}

class UserCardCell: UICollectionViewCell {
    
    weak var delegate: UserCellDelegate?
    
    public var selectedCard: Card!
    
    private var isPressed = false
    
    private lazy var longPressGesture: UILongPressGestureRecognizer = {
        let gesture = UILongPressGestureRecognizer()
        gesture.addTarget(self, action: #selector(longPressed(_:)))
        return gesture
    }()
    
    
    public lazy var cardTitle: UILabel = {
        let label = UILabel()
        label.text = "flash card sample"
        label.numberOfLines = 2
        return label
    }()
    
    
    public lazy var answers: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.alpha = 0
        return label
    }()
    
    
    public lazy var ellipsisButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis.circle"), for: .normal)
        button.addTarget(self, action: #selector(detailActionButtonPressed(_:)), for: .touchUpInside)
        return button
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
    
    //----------------------------------------------------------
    // MARK: OBJC ACTION METHODS
    
    @objc public func detailActionButtonPressed(_ sender: UIButton) {
        delegate?.deleteButtonPressed(cell: self, card: selectedCard)
    }
    
    @objc private func longPressed(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began || gesture.state == .changed {
            return
        }
        isPressed.toggle()
        animate()
    }
    
    //----------------------------------------------------------

    private func animate() {
        if isPressed {
            UIView.transition(with: self, duration: 1.0, options: [.transitionFlipFromRight], animations: {
                self.answers.alpha = 1.0
                self.cardTitle.alpha = 0
            }, completion: nil)
        } else {
            UIView.transition(with: self, duration: 1.0, options: [.transitionFlipFromLeft], animations: {
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
        addSubview(ellipsisButton)
        ellipsisButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ellipsisButton.topAnchor.constraint(equalTo: topAnchor),
            ellipsisButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            ellipsisButton.heightAnchor.constraint(equalToConstant: 44),
            ellipsisButton.widthAnchor.constraint(equalTo: ellipsisButton.heightAnchor)
        ])
    }
    
    private func titleConstraints() {
        addSubview(cardTitle)
        cardTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardTitle.topAnchor.constraint(equalTo: ellipsisButton.bottomAnchor, constant: 10),
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
