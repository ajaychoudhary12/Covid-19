//
//  ResultVC.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 20/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {
  
  var result: Result? {
    didSet {
      guard let result = result else { return }
      titleLabel.text = result.rawValue
      switch result {
      case .lowRisk:
        titleLabel.textColor = .systemGreen
        actionButton.backgroundColor = .systemGreen
      case .mediumRisk:
        titleLabel.textColor = .systemOrange
        actionButton.backgroundColor = .systemOrange
      case .highRisk:
        titleLabel.textColor = .systemPink
        actionButton.backgroundColor = .systemPink
      }
    }
  }
  
  let containerView = UIView()
  let titleLabel = UILabel()
  let messageLabel = UILabel()
  let actionButton = UIButton()
  
  let message = "This is based on current understanding of the disease which is subject to change. Please do consult the doctor and take their advice in case you are not feeling well."
  let padding: CGFloat = 20
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
    setupView()
  }
  
  private func setupView() {
    setupContainerView()
    setupTitleLabel()
    setupActionButton()
    setupMessageLabel()
  }
  
  private func setupContainerView() {
    view.addSubview(containerView)
    containerView.translatesAutoresizingMaskIntoConstraints = false
    
    let centerY = containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    let centerX = containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    let height = containerView.heightAnchor.constraint(equalToConstant: 220)
    let width = containerView.widthAnchor.constraint(equalToConstant: 280)
    NSLayoutConstraint.activate([centerY, centerX, height, width])
    
    containerView.backgroundColor = .systemBackground
    containerView.layer.cornerRadius = 16
    containerView.layer.borderWidth = 2
    containerView.layer.borderColor = UIColor.white.cgColor
  }
  
  private func setupTitleLabel() {
    containerView.addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
  
    let top = titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding)
    let leading = titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding)
    let trailing = titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding)
    let height = titleLabel.heightAnchor.constraint(equalToConstant: 28)
    NSLayoutConstraint.activate([top, leading, trailing, height])
    
    titleLabel.textAlignment = .center
    titleLabel.font = .boldSystemFont(ofSize: 20)
    titleLabel.adjustsFontSizeToFitWidth = true
    titleLabel.minimumScaleFactor = 0.9
    titleLabel.lineBreakMode = .byTruncatingTail
  }
  
  private func setupActionButton() {
    containerView.addSubview(actionButton)
    actionButton.translatesAutoresizingMaskIntoConstraints = false
    
    let bottom = actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding)
    let leading = actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding)
    let trailing = actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding)
    let height = actionButton.heightAnchor.constraint(equalToConstant: 44)
    NSLayoutConstraint.activate([bottom, leading,trailing, height])
    
    actionButton.setTitle("Ok", for: .normal)
    actionButton.layer.cornerRadius = 10
    actionButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
  }
  
  private func setupMessageLabel() {
    containerView.addSubview(messageLabel)
    messageLabel.translatesAutoresizingMaskIntoConstraints = false
      
    let top = messageLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8)
    let leading = messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding)
    let trailing = messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding)
    let bottom = messageLabel.bottomAnchor.constraint(equalTo: actionButton.bottomAnchor, constant: -12)
    NSLayoutConstraint.activate([top, leading, trailing, bottom])
    
    messageLabel.text = message
    messageLabel.numberOfLines = 0
    messageLabel.textAlignment = .center
    messageLabel.font = .systemFont(ofSize: 13)
    messageLabel.textColor = .secondaryLabel
    messageLabel.adjustsFontSizeToFitWidth = true
    messageLabel.minimumScaleFactor = 0.75
    messageLabel.lineBreakMode = .byWordWrapping
  }
  
  @objc private func dismissVC() {
    dismiss(animated: true)
  }
}
