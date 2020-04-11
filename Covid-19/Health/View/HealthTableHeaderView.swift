//
//  HealthTableHeaderView.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 09/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class HealthTableHeaderView: UICollectionReusableView {
  
  private let cornerRadius: CGFloat = 12
  private let containerView = UIView()
  private let parentContainerView = UIView()
  private let helpLineLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private func setupView() {
    backgroundColor = .systemGroupedBackground
    setupParentContainerView()
    setupContainerView()
    setupHelpLineLabel()
  }
  
  private func setupParentContainerView() {
    addSubview(parentContainerView)
    parentContainerView.translatesAutoresizingMaskIntoConstraints = false
    
    let top = parentContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 2)
    let leading = parentContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
    let trailing = parentContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
    let bottom = parentContainerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2)
    NSLayoutConstraint.activate([top, leading, trailing, bottom])
    
    parentContainerView.backgroundColor = .systemGroupedBackground
    parentContainerView.layer.cornerRadius = cornerRadius
    parentContainerView.layer.shadowColor = UIColor.lightGray.cgColor
    parentContainerView.layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
    parentContainerView.layer.shadowRadius = cornerRadius
    parentContainerView.layer.shadowOpacity = 0.9
  }
  
  private func setupContainerView() {
    addSubview(containerView)
    containerView.translatesAutoresizingMaskIntoConstraints = false
    
    let top = containerView.topAnchor.constraint(equalTo: parentContainerView.topAnchor)
    let leading = containerView.leadingAnchor.constraint(equalTo: parentContainerView.leadingAnchor)
    let trailing = containerView.trailingAnchor.constraint(equalTo: parentContainerView.trailingAnchor)
    let bottom = containerView.bottomAnchor.constraint(equalTo: parentContainerView.bottomAnchor)
    NSLayoutConstraint.activate([top, leading, trailing, bottom])
    
    containerView.backgroundColor = .systemGroupedBackground
    containerView.layer.cornerRadius = cornerRadius
    containerView.clipsToBounds = true
  }
  
  private func setupHelpLineLabel() {
    containerView.addSubview(helpLineLabel)
    helpLineLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let height = helpLineLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8)
    let leading = helpLineLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12)
    let trailing = helpLineLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
    let centerY = helpLineLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
    NSLayoutConstraint.activate([height, leading, trailing, centerY])
    
    helpLineLabel.font = .boldSystemFont(ofSize: 20)
    helpLineLabel.text = "Helpline Centers in India"
    helpLineLabel.textColor = .systemPink
    helpLineLabel.textAlignment = .center
    helpLineLabel.backgroundColor = .systemGroupedBackground
  }
}
