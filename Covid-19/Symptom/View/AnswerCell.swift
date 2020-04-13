//
//  AnswerCell.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 12/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class AnswerCell: UICollectionViewCell {
  
  private let answerButton = UIButton(type: .system)
  private let cornerRadius: CGFloat = 15
  var answer: String? {
    didSet {
      answerButton.setTitle(answer, for: .normal)
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
    backgroundColor = .systemGroupedBackground
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
    addSubview(answerButton)
    answerButton.translatesAutoresizingMaskIntoConstraints = false
    
    let top = answerButton.topAnchor.constraint(equalTo: topAnchor)
    let leading = answerButton.leadingAnchor.constraint(equalTo: leadingAnchor)
    let trailing = answerButton.trailingAnchor.constraint(equalTo: trailingAnchor)
    let bottom = answerButton.bottomAnchor.constraint(equalTo: bottomAnchor)
    NSLayoutConstraint.activate([top, leading, trailing, bottom])
    
    answerButton.titleLabel?.font =  .boldSystemFont(ofSize: 16)
    answerButton.setTitleColor(.systemPink, for: .normal)
    answerButton.addTarget(self, action: #selector(answerAction), for: .touchUpInside)
  }
  
  @objc private func answerAction() {
    
  }
}
