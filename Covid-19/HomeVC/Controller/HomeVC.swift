//
//  ViewController.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 02/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
  
  let states = [ "Andhra Pradesh",
  "Arunachal Pradesh",
  "Assam",
  "Bihar",
  "Chhattisgarh",
  "Goa",
  "Gujarat",
  "Haryana",
  "Himachal Pradesh",
  "Jammu and Kashmir",
  "Jharkhand",
  "Karnataka",
  "Kerala",
  "Madhya Pradesh",
  "Maharashtra",
  "Manipur",
  "Meghalaya",
  "Mizoram",
  "Nagaland",
  "Odisha",
  "Punjab",
  "Rajasthan",
  "Sikkim",
  "Tamil Nadu",
  "Telangana",
  "Tripura",
  "Uttarakhand",
  "Uttar Pradesh",
  "West Bengal",
  "Andaman and Nicobar Islands",
  "Chandigarh",
  "Dadra and Nagar Haveli",
  "Daman and Diu",
  "Delhi",
  "Lakshadweep",
  "Puducherry"]
  
  private let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 15.0, left: 1.0, bottom: 1.0, right: 1.0)
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    return collectionView
  }()
  
  private let topView = UIView()
  private let cellId = "cellid"
  private let backHeaderId = "backheaderid"
  
  override func loadView() {
    super.loadView()
    setupView()
  }
  
  private func setupView() {
    view.backgroundColor = .systemGroupedBackground
    setupTopView()
    setupCollectionView()
  }
  
  private func setupTopView() {
    view.addSubview(topView)
    topView.translatesAutoresizingMaskIntoConstraints = false
    
    let top = topView.topAnchor.constraint(equalTo: view.topAnchor)
    let leading = topView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
    let trailing = topView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    let height = topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
    NSLayoutConstraint.activate([top, leading, trailing, height])
    
    topView.backgroundColor = .systemGroupedBackground
  }
  
  private func setupCollectionView() {
    view.addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    let top = collectionView.topAnchor.constraint(equalTo: view.topAnchor)
    let leading = collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
    let trailing = collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
    let bottom = collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    NSLayoutConstraint.activate([top, leading, trailing, bottom])
    
    collectionView.dataSource = self
    collectionView.delegate = self
    
    collectionView.backgroundColor = .systemGroupedBackground
    collectionView.bounces = false
    collectionView.alwaysBounceVertical = false
    
    collectionView.register(StateCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.register(StatsHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: backHeaderId)
    if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout { layout.sectionHeadersPinToVisibleBounds = false }
  }
}

extension HomeVC: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return states.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! StateCell
    cell.state = states[indexPath.row]
    return cell
  }
  
  // Customising Header
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: backHeaderId, for: indexPath) as! StatsHeaderView
    return headerView
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: view.frame.width, height: 280)
  }
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 16
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = collectionView.frame.width - 40
    return CGSize(width: width, height: 60)
  }
}
