//
//  File.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 15/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class SideMenuVC: UIViewController {
  
  private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
  private let appImage = UIImageView()
  private let appNameLabel = UILabel()
  private let quoteLabel = UILabel()
  
  private let cellId = "cellid"
  private let settings = [
    Setting(name: "Home", imageName: "globe"),
    Setting(name: "Precaution", imageName: "globe"),
    Setting(name: "Helpline Contacts", imageName: "globe"),
    Setting(name: "Helpful Links", imageName: "globe")
  ]
  
  override func loadView() {
    super.loadView()
    setupView()
  }
  
  //MARK: - SetupView
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    collectionView.reloadData()
  }
  
  private func setupView() {
    view.backgroundColor = .white
    setupAppImage()
    setupAppNameLabel()
    setupQuoteLabel()
    setupCollectionView()
  }
  
  private func setupAppImage() {
    view.addSubview(appImage)
    appImage.translatesAutoresizingMaskIntoConstraints = false
    
    let top = appImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
    let leading = appImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18)
    let height = appImage.heightAnchor.constraint(equalToConstant: 70)
    let width = appImage.widthAnchor.constraint(equalToConstant: 70)
    NSLayoutConstraint.activate([top, leading, height, width])
    
    appImage.layer.cornerRadius = 35
    appImage.backgroundColor = .systemGreen
  }
  
  private func setupAppNameLabel() {
    view.addSubview(appNameLabel)
    appNameLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let top = appNameLabel.topAnchor.constraint(equalTo: appImage.bottomAnchor, constant: 20)
    let leading = appNameLabel.leadingAnchor.constraint(equalTo: appImage.leadingAnchor)
    let trailing = appNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    let height = appNameLabel.heightAnchor.constraint(equalToConstant: 29)
    NSLayoutConstraint.activate([top, leading, trailing, height])
    
    appNameLabel.textColor = .systemPink
    appNameLabel.font = .boldSystemFont(ofSize: 28)
    appNameLabel.text = "Covid-19"
  }
  
  private func setupQuoteLabel() {
    view.addSubview(quoteLabel)
    quoteLabel.translatesAutoresizingMaskIntoConstraints = false

    let top = quoteLabel.topAnchor.constraint(equalTo: appNameLabel.bottomAnchor, constant: 20)
    let leading = quoteLabel.leadingAnchor.constraint(equalTo: appNameLabel.leadingAnchor)
    let trailing = quoteLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    let height = quoteLabel.heightAnchor.constraint(equalToConstant: 58)
    NSLayoutConstraint.activate([top, leading, trailing, height])
    
    quoteLabel.text = "Stay Home \nStay Safe !!"
    quoteLabel.numberOfLines = 0
    quoteLabel.textColor = .systemBlue
    quoteLabel.font = .boldSystemFont(ofSize: 22)
  }
  
  private func setupCollectionView() {
    view.addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    let top = collectionView.topAnchor.constraint(equalTo: quoteLabel.bottomAnchor, constant: 35)
    let leading = collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
    let trailing = collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    let height = collectionView.heightAnchor.constraint(equalToConstant: 200)
    NSLayoutConstraint.activate([top, leading, trailing, height])
    
    collectionView.backgroundColor = .white
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(SettingsCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
  }
}

  //MARK: - Extensions

extension SideMenuVC: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return settings.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SettingsCollectionViewCell
    cell.setting = settings[indexPath.item]
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    switch indexPath.item {
    case 2:
      let contactsVC = ContactsVC()
      guard let parent = self.parent else { return }
      guard let navController = parent.navigationController else { return }
      navController.pushViewController(contactsVC, animated: true)
    default:
      print("yo")
    }
  }
}

extension SideMenuVC: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = view.frame.width
    return CGSize(width: width, height: 44)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}
