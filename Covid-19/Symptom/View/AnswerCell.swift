//
//  AnswerCell.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 12/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class AnswerCell: UICollectionViewCell {
  
  let answerLabel = UILabel()
  private let cornerRadius: CGFloat = 15
  var answer: String? {
    didSet {
      answerLabel.text = answer
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView() {
    backgroundColor = .white
    layer.cornerRadius = cornerRadius
    setupAnswerButton()
    setupShadow()
  }
  
  private func setupShadow() {
    layer.cornerRadius = cornerRadius
    layer.shadowColor = UIColor.lightGray.cgColor
    layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
    layer.shadowRadius = cornerRadius
    layer.shadowOpacity = 0.5
    
    contentView.layer.cornerRadius = cornerRadius
    contentView.clipsToBounds = true
  }
  
  private func setupAnswerButton() {
    addSubview(answerLabel)
    answerLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let top = answerLabel.topAnchor.constraint(equalTo: topAnchor)
    let leading = answerLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
    let trailing = answerLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
    let bottom = answerLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
    NSLayoutConstraint.activate([top, leading, trailing, bottom])
    
    answerLabel.font =  .boldSystemFont(ofSize: 16)
    answerLabel.textColor = .systemPink
    answerLabel.textAlignment = .center
  }
}
