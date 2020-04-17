//
//  LinkCell.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 16/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class LinkCell: UICollectionViewCell {
  
  private let linkNameLabel = UILabel()
  private let linkButton = UIButton(type: .system)
  private let callButton = UIButton(type: .system)
  private let bottomBorder = UIView()
  
  var link: Link? {
    didSet {
      guard let link = link else { return }
      linkButton.setTitle(link.url, for: .normal)
      linkNameLabel.text = link.name
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
    //setupCallButton()
    setupBottomBorder()
  }
  
  private func setupStateLabel() {
    addSubview(linkNameLabel)
    linkNameLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let top = linkNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8)
    let leading = linkNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 27)
    let trailing = linkNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
    let height = linkNameLabel.heightAnchor.constraint(equalToConstant: 22)
    NSLayoutConstraint.activate([top, leading, trailing, height])
    
    linkNameLabel.font = .boldSystemFont(ofSize: 17)
    linkNameLabel.adjustsFontSizeToFitWidth = true
    linkNameLabel.minimumScaleFactor = 0.82
    linkNameLabel.textColor = .black
  }
  
  private func setupNumberLabel(){
    addSubview(linkButton)
    linkButton.translatesAutoresizingMaskIntoConstraints = false
    
    let top = linkButton.topAnchor.constraint(equalTo: linkNameLabel.bottomAnchor, constant: 6)
    let leading = linkButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 27)
    let trailing = linkButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
    let height = linkButton.heightAnchor.constraint(equalToConstant: 22)
    NSLayoutConstraint.activate([top, leading, trailing, height])
    
    linkButton.setTitleColor(.systemBlue, for: .normal)
    linkButton.titleLabel?.font = .boldSystemFont(ofSize: 17)
    linkButton.contentHorizontalAlignment = .left
    linkButton.addTarget(self, action: #selector(numberAction), for: .touchUpInside)
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
    
    let leading = bottomBorder.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25)
    let trailing = bottomBorder.trailingAnchor.constraint(equalTo: trailingAnchor)
    let height = bottomBorder.heightAnchor.constraint(equalToConstant: 0.5)
    let bottom = bottomBorder.bottomAnchor.constraint(equalTo: bottomAnchor)
    NSLayoutConstraint.activate([leading, trailing, height, bottom])
    
    bottomBorder.backgroundColor = .lightGray
  }
  
  @objc private func numberAction(_ sender: UIButton) {
    guard let link = link else { return }
    guard let url = URL(string: link.url),
      UIApplication.shared.canOpenURL(url) else { return }
    UIApplication.shared.open(url)
  }
  
}
