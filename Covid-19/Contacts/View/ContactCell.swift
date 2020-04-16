//
//  ContactCell.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 15/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class ContactCell: UICollectionViewCell {
  
  private let stateLabel = UILabel()
  private let numberButton = UIButton(type: .system)
  private let callButton = UIButton(type: .system)
  private let bottomBorder = UIView()
  
  var contact: HelpLineContact? {
    didSet {
      guard let contact = contact else { return }
      numberButton.setTitle(contact.number, for: .normal)
      stateLabel.text = contact.state
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
    setupStateLabel()
    setupNumberLabel()
    setupCallButton()
    setupBottomBorder()
  }
  
  private func setupStateLabel() {
    addSubview(stateLabel)
    stateLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let top = stateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8)
    let leading = stateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28)
    let trailing = stateLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
    let height = stateLabel.heightAnchor.constraint(equalToConstant: 22)
    NSLayoutConstraint.activate([top, leading, trailing, height])
    
    stateLabel.font = .boldSystemFont(ofSize: 17)
    stateLabel.textColor = .systemPink
  }
  
  private func setupNumberLabel(){
    addSubview(numberButton)
    numberButton.translatesAutoresizingMaskIntoConstraints = false
    
    let top = numberButton.topAnchor.constraint(equalTo: stateLabel.bottomAnchor, constant: 6)
    let leading = numberButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28)
    let width = numberButton.widthAnchor.constraint(equalToConstant: 140)
    let height = numberButton.heightAnchor.constraint(equalToConstant: 22)
    NSLayoutConstraint.activate([top, leading, width, height])
    
    numberButton.setTitleColor(.systemBlue, for: .normal)
    numberButton.titleLabel?.font = .boldSystemFont(ofSize: 17)
    numberButton.contentHorizontalAlignment = .left
    numberButton.addTarget(self, action: #selector(numberAction), for: .touchUpInside)
  }
  
  private func setupCallButton() {
    addSubview(callButton)
    callButton.translatesAutoresizingMaskIntoConstraints = false
    
    let centerY = callButton.centerYAnchor.constraint(equalTo: centerYAnchor)
    let trailing = callButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
    let height = callButton.heightAnchor.constraint(equalToConstant: 50)
    let width = callButton.widthAnchor.constraint(equalToConstant: 50)
    NSLayoutConstraint.activate([centerY, trailing, height, width])
    
    callButton.layer.cornerRadius = 50 / 2
    callButton.imageEdgeInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
    callButton.setImage(UIImage(named: "phone-call")?.withRenderingMode(.alwaysOriginal), for: .normal)
    callButton.addTarget(self, action: #selector(numberAction), for: .touchUpInside)
  }
  
  private func setupBottomBorder() {
    addSubview(bottomBorder)
    bottomBorder.translatesAutoresizingMaskIntoConstraints = false
    
    let leading = bottomBorder.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28)
    let trailing = bottomBorder.trailingAnchor.constraint(equalTo: trailingAnchor)
    let height = bottomBorder.heightAnchor.constraint(equalToConstant: 0.5)
    let bottom = bottomBorder.bottomAnchor.constraint(equalTo: bottomAnchor)
    NSLayoutConstraint.activate([leading, trailing, height, bottom])
    
    bottomBorder.backgroundColor = .lightGray
  }
  
  @objc private func numberAction(_ sender: UIButton) {
    guard let contact = contact else{ return }
    guard let url = URL(string: "telprompt://\(contact.number)"),
      UIApplication.shared.canOpenURL(url) else { return }
    UIApplication.shared.open(url)
  }
}
