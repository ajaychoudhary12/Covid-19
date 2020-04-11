//
//  HelplineCentersVC.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 10/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class HelplineCentersVC: UIViewController {
  
  private let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 15.0, left: 1.0, bottom: 1.0, right: 1.0)
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    return collectionView
  }()
  
  private let cellId = "cellid"
  private let headerId = "headerid"
  
  var hospitalState: HospitalState!
  
  override func loadView() {
    super.loadView()
    setupView()
  }
  
  //MARK: - SetupView
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: animated)
  }
  
  private func setupView() {
    view.backgroundColor = .systemGroupedBackground
    self.title = hospitalState.name
    setupCollectionView()
  }
  
  private func setupCollectionView() {
    view.addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    let top = collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
    let leading = collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
    let trailing = collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    let bottom = collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    NSLayoutConstraint.activate([top, leading, trailing, bottom])
    
    collectionView.dataSource = self
    collectionView.delegate = self
    
    collectionView.backgroundColor = .systemGroupedBackground
    collectionView.bounces = false
    collectionView.alwaysBounceVertical = false
    collectionView.register(HelplineCenterCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.register(QuoteHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
  }
  
}

extension HelplineCentersVC: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return hospitalState.hospitals.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HelplineCenterCell
    cell.hospitalName = hospitalState.hospitals[indexPath.item]
    cell.delegate = self
    return cell
  }
  
  //Customising Header
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId, for: indexPath) as! QuoteHeaderView
    headerView.quoteLabel.text = hospitalState.name
    return headerView
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: view.frame.width, height: 100)
  }
  
}

extension HelplineCentersVC: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 16
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = collectionView.frame.width - 40
    return CGSize(width: width, height: 70)
  }
}

extension HelplineCentersVC: HospitalLocationDelegate {
  func locationTapped(location: String) {
    let queryString = location.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
    if let url = URL(string: "http://maps.apple.com/?q=\(queryString)") {
      if UIApplication.shared.canOpenURL(url) {
        UIApplication.shared.open(url, options: [:])
      } else {
        self.presentAlert(title: "", message: "Unable to open location at the moment")
      }
    } else {
      self.presentAlert(title: "", message: "Can't open url")
    }
  }
}
