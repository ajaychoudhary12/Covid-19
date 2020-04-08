//
//  StateStatsHeaderCell.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 06/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class StateStatsHeaderCell: UICollectionViewCell {
  
  private let cornerRadius: CGFloat = 16
  let casesLabel = UILabel()
  let countLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView() {
    setupShadow()
    setupCasesLabel()
    setupCasesCountLabel()
  }
  
  private func setupShadow() {
    layer.cornerRadius = cornerRadius
    layer.shadowColor = UIColor.darkGray.cgColor
    layer.shadowOffset = CGSize(width: 5, height: 5)
    layer.shadowRadius = cornerRadius
    layer.shadowOpacity = 0.8
    
    contentView.layer.cornerRadius = cornerRadius
    contentView.clipsToBounds = true
  }
  
  private func setupCasesLabel() {
    addSubview(casesLabel)
    casesLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let top = casesLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20)
    let leading = casesLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
    let width = casesLabel.widthAnchor.constraint(equalTo: widthAnchor)
    let height = casesLabel.heightAnchor.constraint(equalToConstant: 40)
    NSLayoutConstraint.activate([top, leading, width, height])
    
    casesLabel.text = "Confirmed"
    casesLabel.font = .systemFont(ofSize: 26)
    casesLabel.textColor = .white
    casesLabel.textAlignment = .center
  }
  
  private func setupCasesCountLabel() {
    addSubview(countLabel)
    countLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let centerY = countLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 20)
    let centerX = countLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
    let height = countLabel.heightAnchor.constraint(equalToConstant: 42)
    let width = countLabel.widthAnchor.constraint(equalTo: widthAnchor)
    NSLayoutConstraint.activate([centerY, centerX, height, width])
    
    countLabel.text = ""
    countLabel.font = .systemFont(ofSize: 34)
    countLabel.textColor = .white
    countLabel.textAlignment = .center
    countLabel.adjustsFontSizeToFitWidth = true
    countLabel.minimumScaleFactor = 0.8
  }
  
}
