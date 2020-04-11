//
//  HelplineCenterCell.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 10/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

protocol HospitalLocationDelegate {
  func locationTapped(location: String)
}

class HelplineCenterCell: UICollectionViewCell {
  
  private let hospitalLabel = UILabel()
  private lazy var locationButton = UIButton(type: .system)
  private let cornerRadius: CGFloat = 12
  var delegate: HospitalLocationDelegate?
  
  var hospitalName: String? {
    didSet {
      guard let hospitalName = hospitalName else { return }
      self.hospitalLabel.text = hospitalName
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
    setupHospitalLabel()
    setupLocationButton()
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
  
  private func setupHospitalLabel() {
    addSubview(hospitalLabel)
    hospitalLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let centerY = hospitalLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
    let leading = hospitalLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12)
    let height = hospitalLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75)
    let trailing = hospitalLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70)
    NSLayoutConstraint.activate([centerY, leading, height, trailing])
    
    hospitalLabel.textColor = .white
    hospitalLabel.font = .boldSystemFont(ofSize: 15)
    hospitalLabel.numberOfLines = 2
  }
  
  private func setupLocationButton() {
    addSubview(locationButton)
    locationButton.translatesAutoresizingMaskIntoConstraints = false
    
    let centerY = locationButton.centerYAnchor.constraint(equalTo: centerYAnchor)
    let height = locationButton.heightAnchor.constraint(equalToConstant: 50)
    let width = locationButton.widthAnchor.constraint(equalToConstant: 50)
    let trailing = locationButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
    NSLayoutConstraint.activate([centerY, height, width, trailing])
    
    locationButton.layer.cornerRadius = 25
    locationButton.setImage(UIImage(named: "userGps")?.withRenderingMode(.alwaysOriginal), for: .normal)
    locationButton.imageEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    locationButton.backgroundColor = UIColor.init(white: 0.8, alpha: 0.5)
    locationButton.addTarget(self, action: #selector(locationAction), for: .touchUpInside)
  }
  
  //MARK: - Actions
  
  @objc private func locationAction() {
    guard let hospitalName = hospitalName else { return }
    delegate?.locationTapped(location: hospitalName)
  }
}
