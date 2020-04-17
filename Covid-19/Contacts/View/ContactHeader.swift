//
//  ContactHeader.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 15/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class ContactHeader: UICollectionReusableView {
  
  private let headingLabel = UILabel()
  private let numberLabel = UILabel()
  private let bottomBorder = UIView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView() {
    backgroundColor = .white
    setupHeadingLabel()
    setupNumberLabel()
    setupBottomBorder()
  }
  
  private func setupHeadingLabel() {
    addSubview(headingLabel)
    headingLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let top = headingLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8)
    let leading = headingLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
    let trailing = headingLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
    let height = headingLabel.heightAnchor.constraint(equalToConstant: 30)
    NSLayoutConstraint.activate([top, leading, trailing, height])
    
    headingLabel.textColor = .black
    headingLabel.textAlignment = .center
    headingLabel.text = "Central Helpline Number:"
    headingLabel.font = .boldSystemFont(ofSize: 20)
  }
  
  private func setupNumberLabel() {
    addSubview(numberLabel)
    addSubview(numberLabel)
    numberLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let top = numberLabel.topAnchor.constraint(equalTo: headingLabel.bottomAnchor)
    let leading = numberLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
    let trailing = numberLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
    let height = numberLabel.heightAnchor.constraint(equalToConstant: 30)
    NSLayoutConstraint.activate([top, leading, trailing, height])
    
    numberLabel.textColor = .systemBlue
    numberLabel.textAlignment = .center
    numberLabel.text = "+91-11-23978046"
    numberLabel.font = .boldSystemFont(ofSize: 18)
  }
  
  private func setupBottomBorder() {
    addSubview(bottomBorder)
    bottomBorder.translatesAutoresizingMaskIntoConstraints = false
    
    let leading = bottomBorder.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 27)
    let trailing = bottomBorder.trailingAnchor.constraint(equalTo: trailingAnchor)
    let height = bottomBorder.heightAnchor.constraint(equalToConstant: 0.5)
    let bottom = bottomBorder.bottomAnchor.constraint(equalTo: bottomAnchor)
    NSLayoutConstraint.activate([leading, trailing, height, bottom])
    
    bottomBorder.backgroundColor = .lightGray
  }
  
}
