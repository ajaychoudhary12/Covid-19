//
//  StateCell.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 03/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class StateCell: UICollectionViewCell {
  
  private let stateNameLabel = UILabel()
  private let countLabel = UILabel()
  private let cornerRadius: CGFloat = 12
  
  var state: String? {
    didSet {
      guard let state = state else { return }
      self.stateNameLabel.text = state.uppercased()
      self.countLabel.text = "\(state.count)"
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
    setupShadow()
    setupStateNameLabel()
    setupCountLabel()
  }
  
  private func setupShadow() {
    backgroundColor = .systemGroupedBackground
    layer.cornerRadius = cornerRadius
    layer.shadowColor = UIColor.gray.cgColor
    layer.shadowOffset = CGSize(width: 5, height: 5)
    layer.shadowRadius = cornerRadius
    layer.shadowOpacity = 0.5
    
    contentView.layer.cornerRadius = cornerRadius
    contentView.clipsToBounds = true
  }
  
  private func setupStateNameLabel() {
    addSubview(stateNameLabel)
    stateNameLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let height = stateNameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75)
    let leading = stateNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12)
    let centerY = stateNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
    let width = stateNameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7)
    NSLayoutConstraint.activate([height, leading, centerY, width])
    
    stateNameLabel.font = .boldSystemFont(ofSize: 18)
    stateNameLabel.textColor = .systemBlue
  }
  
  private func setupCountLabel() {
    addSubview(countLabel)
    countLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let height = countLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75)
    let trailing = countLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
    let centerY = countLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
    let width = countLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3)
    NSLayoutConstraint.activate([height, trailing, centerY, width])
    
    countLabel.font = .boldSystemFont(ofSize: 18)
    countLabel.textAlignment = .right
    countLabel.textColor = .systemBlue
  }
}
