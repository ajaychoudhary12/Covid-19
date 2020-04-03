//
//  StatsHeaderViewCell.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 02/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class StatsHeaderViewCell: UICollectionViewCell {
  
  private let casesLabel = UILabel()
  private let casesCountLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
    
//  Debugging
//    casesLabel.backgroundColor = .white
//    casesCountLabel.backgroundColor = .lightGray
//
//    casesLabel.backgroundColor = .black
//    casesCountLabel.textColor = .black
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView() {
    setupCasesLabel()
    setupCasesCountLabel()
  }
  
  private func setupCasesLabel() {
    addSubview(casesLabel)
    casesLabel.translatesAutoresizingMaskIntoConstraints = false
      
    let top = casesLabel.topAnchor.constraint(equalTo: topAnchor, constant: 14)
    let leading = casesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14)
    let width = casesLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4)
    let height = casesLabel.heightAnchor.constraint(equalToConstant: 36)
    NSLayoutConstraint.activate([top, leading, width, height])
      
    casesLabel.text = "Confirmed"
    casesLabel.textColor = .white
    casesLabel.font = .systemFont(ofSize: 24)
  }
    
  private func setupCasesCountLabel() {
    addSubview(casesCountLabel)
    casesCountLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let top = casesCountLabel.topAnchor.constraint(equalTo: casesLabel.bottomAnchor)
    let leading = casesCountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14)
    let widht = casesCountLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)
    let height = casesCountLabel.heightAnchor.constraint(equalToConstant: 42)
    NSLayoutConstraint.activate([top, leading, widht, height])
      
    casesCountLabel.text = "2032"
    casesCountLabel.textColor = .white
    casesCountLabel.font = .systemFont(ofSize: 36)
  }

}
