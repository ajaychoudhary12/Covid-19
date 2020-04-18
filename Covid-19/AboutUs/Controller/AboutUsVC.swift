//
//  AboutUsVC.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 16/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class AboutUsVC: UIViewController {
  
  private let appImage = UIImageView()
  private let appNameLabel = UILabel()
  private let versionLabel = UILabel()
  private let quoteLabel = UILabel()
  private let privacyPolicyButton = UIButton(type: .system)
  private let termsAndConditionsButton = UIButton(type: .system)
  
  private let developedByLabel = UILabel()
  private let ajayLabel = UILabel()
  private let ajayLabelBottomBorder = UILabel()
  private let sainiLabel = UILabel()
  
  override func loadView() {
    super.loadView()
    setupView()
  }
  
  private func setupView() {
    view.backgroundColor = .white
    self.title = "About Us"
    setupAppImage()
    setupAppNameLabel()
    setupVersionLabel()
    setupQuoteLabel()
    setupDevelopedByLabel()
    setupAjayLabel()
    setupAjayLabelBottomBorder()
    setupSainiLabel()
  }
  
  private func setupAppImage() {
    view.addSubview(appImage)
    appImage.translatesAutoresizingMaskIntoConstraints = false
    
    let top = appImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60)
    let centerX = appImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    let height = appImage.heightAnchor.constraint(equalToConstant: 80)
    let width = appImage.widthAnchor.constraint(equalToConstant: 80)
    NSLayoutConstraint.activate([top, centerX, height, width])
    
    appImage.backgroundColor = .lightGray
    appImage.layer.cornerRadius = 80 / 2
  }
  
  private func setupAppNameLabel() {
    view.addSubview(appNameLabel)
    appNameLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let top = appNameLabel.topAnchor.constraint(equalTo: appImage.bottomAnchor, constant: 14)
    let leading = appNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor)
    let trailing = appNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    let height = appNameLabel.heightAnchor.constraint(equalToConstant: 30)
    NSLayoutConstraint.activate([top, leading, trailing, height])
    
    appNameLabel.text = "Covid-19"
    appNameLabel.textColor = .systemPink
    appNameLabel.font = .boldSystemFont(ofSize: 28)
    appNameLabel.textAlignment = .center
  }
  
  private func setupVersionLabel() {
    view.addSubview(versionLabel)
    versionLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let top = versionLabel.topAnchor.constraint(equalTo: appNameLabel.bottomAnchor, constant: 8)
    let leading = versionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor)
    let trailing = versionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    let height = versionLabel.heightAnchor.constraint(equalToConstant: 20)
    NSLayoutConstraint.activate([top, leading, trailing, height])
    
    versionLabel.text = "(version - 1.0)"
    versionLabel.textColor = .systemPink
    versionLabel.font = .systemFont(ofSize: 20)
    versionLabel.textAlignment = .center
  }
  
  private func setupQuoteLabel() {
    view.addSubview(quoteLabel)
    quoteLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let top = quoteLabel.topAnchor.constraint(equalTo: versionLabel.bottomAnchor, constant: 20)
    let leading = quoteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor)
    let trailing = quoteLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    let height = quoteLabel.heightAnchor.constraint(equalToConstant: 22)
    NSLayoutConstraint.activate([top, leading, trailing, height])
    
    quoteLabel.text = "Stay Safe 😊✌🏻"
    quoteLabel.textColor = .systemBlue
    quoteLabel.textAlignment = .center
    quoteLabel.font = .boldSystemFont(ofSize: 17)
  }
  
  private func setupDevelopedByLabel() {
    view.addSubview(developedByLabel)
    developedByLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let top = developedByLabel.topAnchor.constraint(equalTo: quoteLabel.bottomAnchor, constant: 86)
    let leading = developedByLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor)
    let trailing = developedByLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    let height = developedByLabel.heightAnchor.constraint(equalToConstant: 62)
    NSLayoutConstraint.activate([top, leading, trailing, height])
    
    developedByLabel.text = "Developed &\nDesigned By:"
    developedByLabel.font = .systemFont(ofSize: 22)
    developedByLabel.numberOfLines = 2
    developedByLabel.textAlignment = .center
    developedByLabel.textColor = .systemPink
  }
  
  private func setupAjayLabel() {
    view.addSubview(ajayLabel)
    ajayLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let top = ajayLabel.topAnchor.constraint(equalTo: developedByLabel.bottomAnchor, constant: 16)
    let leading = ajayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor)
    let trailing = ajayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    let height = ajayLabel.heightAnchor.constraint(equalToConstant: 46)
    NSLayoutConstraint.activate([top, leading, trailing, height])
    
    ajayLabel.text = "Ajay Choudhary\najaychoudhary19990@gmail.com"
    ajayLabel.textColor = .systemBlue
    ajayLabel.font = .systemFont(ofSize: 16)
    ajayLabel.textAlignment = .center
    ajayLabel.numberOfLines = 2
  }
  
  private func setupAjayLabelBottomBorder() {
    view.addSubview(ajayLabelBottomBorder)
    ajayLabelBottomBorder.translatesAutoresizingMaskIntoConstraints = false
    
    let top = ajayLabelBottomBorder.topAnchor.constraint(equalTo: ajayLabel.bottomAnchor, constant: 4)
    let leading = ajayLabelBottomBorder.leadingAnchor.constraint(equalTo: view.leadingAnchor)
    let trailing = ajayLabelBottomBorder.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    let height = ajayLabelBottomBorder.heightAnchor.constraint(equalToConstant: 0.5)
    NSLayoutConstraint.activate([top, leading, trailing, height])
    
    ajayLabelBottomBorder.backgroundColor = .lightGray
  }
  
  private func setupSainiLabel() {
    view.addSubview(sainiLabel)
    sainiLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let top = sainiLabel.topAnchor.constraint(equalTo: ajayLabelBottomBorder.bottomAnchor, constant: 1)
    let leading = sainiLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor)
    let trailing = sainiLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    let height = sainiLabel.heightAnchor.constraint(equalToConstant: 46)
    NSLayoutConstraint.activate([top, leading, trailing, height])
    
    sainiLabel.text = "Shubham Saini\nsaini0.shubham@gmail.com"
    sainiLabel.textColor = .systemBlue
    sainiLabel.font = .systemFont(ofSize: 16)
    sainiLabel.textAlignment = .center
    sainiLabel.numberOfLines = 2
  }
  
}
