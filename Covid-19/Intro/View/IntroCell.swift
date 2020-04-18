//
//  IntroCell.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 17/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class IntroCell: UICollectionViewCell {
  
  private let imageView = UIImageView()
  private let descriptionLabel = UILabel()
  
  var precaution: Precaution? {
    didSet {
      guard let precaution = precaution else { return }
      backgroundColor = precaution.backgroundColor
      descriptionLabel.text = precaution.description
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
    setupImageView()
    setupDescriptionLabel()
  }
  
  private func setupImageView() {
    addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    
    let top = imageView.topAnchor.constraint(equalTo: topAnchor, constant: 66)
    let centerX = imageView.centerXAnchor.constraint(equalTo: centerXAnchor)
    let width = imageView.widthAnchor.constraint(equalToConstant: frame.width - 70)
    let height = imageView.heightAnchor.constraint(equalToConstant: frame.width - 70)
    NSLayoutConstraint.activate([top, centerX, width, height])
    
    imageView.backgroundColor = .systemBlue
  }
  
  private func setupDescriptionLabel() {
    addSubview(descriptionLabel)
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let top = descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 28)
    let centerX = descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
    let width = descriptionLabel.widthAnchor.constraint(equalTo: widthAnchor)
    let height = descriptionLabel.heightAnchor.constraint(equalToConstant: 50)
    NSLayoutConstraint.activate([top, centerX, width, height])
    
    descriptionLabel.font = .boldSystemFont(ofSize: 20)
    descriptionLabel.textColor = .systemPink
    descriptionLabel.textAlignment = .center
    descriptionLabel.numberOfLines = 2
  }
  
}
