//
//  SettingsCollectionViewCell.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 15/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class SettingsCollectionViewCell: UICollectionViewCell {
  
  private let imageView = UIImageView()
  private let titleLabel = UILabel()
  
  var setting: Setting? {
    didSet {
      guard let setting = setting else { return }
      titleLabel.text = setting.name
      imageView.image = UIImage(named: setting.imageName)
    }
  }
  
  override var isSelected: Bool {
    didSet {
      if isSelected { backgroundColor = .systemGroupedBackground } else { backgroundColor = .white }
    }
  }
  
  override var isHighlighted: Bool {
    didSet {
      if isHighlighted { backgroundColor = .systemGroupedBackground } else { backgroundColor = .white }
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
    setupTitleLabel()
  }
  
  private func setupImageView() {
    addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    
    let centerY = imageView.centerYAnchor.constraint(equalTo: centerYAnchor)
    let leading = imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22)
    let height = imageView.heightAnchor.constraint(equalToConstant: 25)
    let width = imageView.widthAnchor.constraint(equalToConstant: 25)
    NSLayoutConstraint.activate([centerY, leading, height, width])
  }
  
  private func setupTitleLabel() {
    addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let centerY = titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
    let leading = titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 12)
    let trailing = titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
    let height = titleLabel.heightAnchor.constraint(equalToConstant: 40)
    NSLayoutConstraint.activate([centerY, leading, trailing, height])
    
    titleLabel.font = .boldSystemFont(ofSize: 20)
    titleLabel.textColor = .systemPink
  }
  
}
