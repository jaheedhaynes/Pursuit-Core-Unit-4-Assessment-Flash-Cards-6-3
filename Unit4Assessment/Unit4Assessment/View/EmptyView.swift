//
//  EmptyView.swift
//  Unit4Assessment
//
//  Created by Jaheed Haynes on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class EmptyView: UIView {

    // title and message
       
       public lazy var titleLabel: UILabel = {
           let label = UILabel()
           label.font = UIFont.preferredFont(forTextStyle: .headline)
           label.numberOfLines = 1
           label.textAlignment = .center
           label.text = "Create A Flashcard"
           return label
       }()
       
       public lazy var messageLabel: UILabel = {
           let label = UILabel()
            label.font = UIFont.preferredFont(forTextStyle: .subheadline)
           label.numberOfLines = 4
           label.textAlignment = .center
           label.text = "PRETTY PLEASE"
           return label
       }()

//       override init(frame: CGRect) {
//           super .init(frame: UIScreen.main.bounds)
//           commonInit()
//       }
       
       init(title: String, message: String) {
           super.init(frame: UIScreen.main.bounds)
           titleLabel.text = title
           messageLabel.text = message
           commonInit()
           
       }
       
       required init?(coder: NSCoder) {
           super.init(coder: coder)
           commonInit()
       }
       
       private func commonInit() {
           setuoMessageLabel()
           setupTitleLabelConstraints()
       }
       
       private func setuoMessageLabel(){
           addSubview(messageLabel)
           
           messageLabel.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
           messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
           messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
           messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
           messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
           ])
           
           
       }
       
       private func setupTitleLabelConstraints() {
           addSubview(titleLabel)
           
           titleLabel.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
               titleLabel.bottomAnchor.constraint(equalTo: messageLabel.topAnchor, constant:-8),
               titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
               titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
           ])
       }

}
