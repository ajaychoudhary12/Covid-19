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
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView() {
    setupShadow()
  }
  
  private func setupShadow() {
    layer.cornerRadius = cornerRadius
    layer.shadowColor = UIColor.gray.cgColor
    layer.shadowOffset = CGSize(width: 5, height: 5)
    layer.shadowRadius = cornerRadius
    layer.shadowOpacity = 0.5
    
    contentView.layer.cornerRadius = cornerRadius
    contentView.clipsToBounds = true
  }
  
}
