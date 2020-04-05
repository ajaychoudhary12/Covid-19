//
//  CustomAlert.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 04/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

protocol RefreshHomeDelegate {
  func refresh()
}

class CustomAlertVC: UIViewController {

  private let containerView = UIView()
  private let titleLabel = UILabel()
  private let messageLabel = UILabel()
  
  private var alertTitle: String?
  private var message: String?
  
  private let padding: CGFloat = 16
  private let reachable = "Network Connection Reachable"
  var delegate: RefreshHomeDelegate?
  
  init(title: String, message: String) {
    super.init(nibName: nil, bundle: nil)
    self.alertTitle = title
    self.message = message
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    super.loadView()
    addNetworkObserver()
    setupView()
  }
  
  private func addNetworkObserver() {
    NotificationCenter.default.addObserver(forName: NSNotification.Name("NetworkReachabilityChanged"), object: nil, queue: nil) { (notification) in
      if let userInfo = notification.userInfo {
        if let reachableOrNot = userInfo["reachableOrNot"] as? String {
          if reachableOrNot == self.reachable {
            self.delegate?.refresh()
            self.dismiss(animated: true)
          }
        }
      }
    }
  }
  
  private func setupView() {
    view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.85)
    setupContainerView()
    setupTitleLabel()
    setupMessageLabel()
  }
  
  private func setupContainerView() {
    view.addSubview(containerView)
    containerView.translatesAutoresizingMaskIntoConstraints = false
        
    let centerY = containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    let centerX = containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    let height = containerView.heightAnchor.constraint(equalToConstant: 200)
    let width = containerView.widthAnchor.constraint(equalToConstant: 280)
    NSLayoutConstraint.activate([centerY, centerX, height, width])
    
    containerView.backgroundColor = #colorLiteral(red: 0.9289522767, green: 0.2228988409, blue: 0.2585653067, alpha: 1)
    containerView.layer.cornerRadius = 16
    containerView.layer.borderWidth = 2
    containerView.layer.borderColor = UIColor.black.cgColor
  }
  
  private func setupTitleLabel() {
    containerView.addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let top = titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 24)
    let leading = titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding)
    let trailing = titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding)
    let height = titleLabel.heightAnchor.constraint(equalToConstant: 28)
    NSLayoutConstraint.activate([top, leading, trailing, height])
    
    titleLabel.text = alertTitle ?? "Something went wrong"
    titleLabel.font = .boldSystemFont(ofSize: 24)
    titleLabel.textAlignment = .center
    titleLabel.textColor = .white
    titleLabel.adjustsFontSizeToFitWidth = true
    titleLabel.minimumScaleFactor = 0.9
    titleLabel.lineBreakMode = .byTruncatingTail
  }
  
  private func setupMessageLabel() {
    containerView.addSubview(messageLabel)
    messageLabel.translatesAutoresizingMaskIntoConstraints = false
  
    let top = messageLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 4)
    let leading = messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding)
    let trailing = messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding)
    let bottom = messageLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -4)
    NSLayoutConstraint.activate([top, leading, trailing, bottom])
    
    messageLabel.text = message ?? "Unable to complete request"
    messageLabel.numberOfLines = 0
    messageLabel.textAlignment = .center
    messageLabel.textColor = #colorLiteral(red: 0.8139814734, green: 0.8454999328, blue: 0.8640719056, alpha: 1)
    messageLabel.font = .systemFont(ofSize: 18)
    messageLabel.adjustsFontSizeToFitWidth = true
    messageLabel.minimumScaleFactor = 0.75
    messageLabel.lineBreakMode = .byWordWrapping
  }
  
}

