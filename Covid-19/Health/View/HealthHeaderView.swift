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
    backgroundColor = #colorLiteral(red: 0.9320733547, green: 0.9321055412, blue: 0.9535421729, alpha: 1)
    setupQuoteLabel()
  }
  
  private func setupQuoteLabel() {
    addSubview(quoteLabel)
    quoteLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let top = quoteLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10)
    let leading = quoteLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
    let trailing = quoteLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
    let bottom = quoteLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
    NSLayoutConstraint.activate([top, leading, trailing, bottom])
    
    quoteLabel.text = "Stay Home\n  Stay Safe"
    quoteLabel.font = .boldSystemFont(ofSize: 36)
    quoteLabel.numberOfLines = 3
    quoteLabel.textColor = .systemPink
  }
  
}
