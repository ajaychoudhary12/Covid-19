//
//  HealthStateCell.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 08/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class HealthStateCell: UICollectionViewCell {
  
  private let stateNameLabel = UILabel()
  private let arrowImage = UIImageView(image: UIImage(named: "next-white"))
  private let cornerRadius: CGFloat = 12
  
  var hospitalState: HospitalState? {
    didSet {
      guard let hospitalState = hospitalState else { return }
      stateNameLabel.text = hospitalState.name
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
    backgroundColor = .systemPink
    setupShadow()
    setupStateNameLabel()
    setupNextButton()
  }
  
  private func setupShadow() {
    layer.cornerRadius = cornerRadius
    layer.shadowColor = UIColor.darkGray.cgColor
    layer.shadowOffset = CGSize(width: 5, height: 5)
    layer.shadowRadius = cornerRadius
    layer.shadowOpacity = 0.5
    
    contentView.layer.cornerRadius = cornerRadius
    contentView.clipsToBounds = true
  }
  
  private func setupStateNameLabel() {
    addSubview(stateNameLabel)
    stateNameLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let centerY = stateNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
    let leading = stateNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12)
    let height = stateNameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75)
    let trailing = stateNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
    NSLayoutConstraint.activate([centerY, leading, height, trailing])
    
    stateNameLabel.textColor = .white
    stateNameLabel.font = .boldSystemFont(ofSize: 17)
    stateNameLabel.numberOfLines = 0
  }
  
  private func setupNextButton() {
    addSubview(arrowImage)
    arrowImage.translatesAutoresizingMaskIntoConstraints = false
    
    let centerY = arrowImage.centerYAnchor.constraint(equalTo: centerYAnchor)
    let trailing = arrowImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
    let height = arrowImage.heightAnchor.constraint(equalToConstant: 18)
    let width = arrowImage.widthAnchor.constraint(equalToConstant: 24)
    NSLayoutConstraint.activate([centerY, trailing, height, width])
    
  }
  
}
