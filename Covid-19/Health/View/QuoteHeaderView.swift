//
//  HealthHeaderView.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 09/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class QuoteHeaderView: UICollectionReusableView {
  
  let quoteLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView() {
    backgroundColor = .white
    setupQuoteLabel()
  }
  
  private func setupQuoteLabel() {
    addSubview(quoteLabel)
    quoteLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let top = quoteLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10)
    let leading = quoteLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 26)
    let trailing = quoteLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
    let bottom = quoteLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
    NSLayoutConstraint.activate([top, leading, trailing, bottom])
    
    quoteLabel.font = .boldSystemFont(ofSize: 32)
    quoteLabel.textColor = .systemPink
  }
  
}
