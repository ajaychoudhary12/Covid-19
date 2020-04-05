//
//  TableHeadingView.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 03/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class TableHeadingView: UICollectionReusableView {
  
  private let stateLabel = UILabel()
  private let confirmedLabel = UILabel()
  private let cornerRadius: CGFloat = 12
  private let containerView = UIView()
  private let parentContainerView = UIView()
  
  var countryDataCardState: CountryDataCardState? {
    didSet {
      guard let countryDataCardState = countryDataCardState else { return }
      confirmedLabel.text = countryDataCardState.rawValue.uppercased()
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
    setupParentContainerView()
    setupContainerView()
    setupStateLabel()
    setupConfirmedLabel()
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
  
  private func setupStateLabel() {
    containerView.addSubview(stateLabel)
    stateLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let height = stateLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75)
    let leading = stateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12)
    let centerY = stateLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
    let width = stateLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2)
    NSLayoutConstraint.activate([height, leading, centerY, width])
    
    stateLabel.font = .boldSystemFont(ofSize: 16)
    stateLabel.text = "STATE"
    stateLabel.textColor = .systemRed
    
    stateLabel.clipsToBounds = true
    stateLabel.layer.cornerRadius = cornerRadius
  }
  
  private func setupConfirmedLabel() {
    containerView.addSubview(confirmedLabel)
    confirmedLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let height = confirmedLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75)
    let trailing = confirmedLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12)
    let centerY = confirmedLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
    let width = confirmedLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.28)
    NSLayoutConstraint.activate([height, trailing, centerY, width])
    
    confirmedLabel.font = .boldSystemFont(ofSize: 16)
    confirmedLabel.text = "CONFIRMED"
    confirmedLabel.textAlignment = .right
    confirmedLabel.textColor = .systemRed
  }
}
