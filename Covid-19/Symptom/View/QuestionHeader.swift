//
//  QuestionHeader.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 12/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class QuestionHeader: UICollectionReusableView {
  
  private let questionLabel = UILabel()
  var question: String? {
    didSet {
      self.questionLabel.text = question
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
    setupQuestionLabel()
  }
  
  private func setupQuestionLabel() {
    addSubview(questionLabel)
    questionLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let top = questionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4)
    let leading = questionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
    let trailing = questionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
    let bottom = questionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
    NSLayoutConstraint.activate([top, leading, trailing, bottom])
    
    questionLabel.backgroundColor = .white
    questionLabel.numberOfLines = 0
    questionLabel.textColor = .systemPink
    questionLabel.font = .boldSystemFont(ofSize: 16)
  }
}
