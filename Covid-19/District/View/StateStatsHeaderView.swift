//
//  StateStatsHeaderView.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 06/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class StateStatsHeaderView: UICollectionReusableView {
  
  private let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.sectionInset = UIEdgeInsets(top: 20.0, left: 36.0, bottom: 20.0, right: 36.0)
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    return collectionView
  }()
  
  private let cellId = "cellid"
  var stateData : StateData?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView() {
    backgroundColor = .white
    setupCollectionView()
  }
  
  private func setupCollectionView() {
    addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
      
    let top = collectionView.topAnchor.constraint(equalTo: topAnchor)
    let leading = collectionView.leadingAnchor.constraint(equalTo: leadingAnchor)
    let trailing = collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
    let bottom = collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
    NSLayoutConstraint.activate([top, leading, trailing, bottom])
    
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.backgroundColor = .white
    
    collectionView.showsVerticalScrollIndicator = false
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.register(StateStatsHeaderCell.self, forCellWithReuseIdentifier: cellId)
  }
}

extension StateStatsHeaderView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! StateStatsHeaderCell
    switch indexPath.item {
    case 0:
      cell.backgroundColor = .systemPink
      cell.casesLabel.text = "Confirmed"
      cell.countLabel.text = stateData?.confirmed
    case 1:
      cell.backgroundColor = .systemBlue
      cell.casesLabel.text = "Active"
      cell.countLabel.text = stateData?.active
    case 2:
      cell.backgroundColor = .systemGreen
      cell.casesLabel.text = "Recovered"
      cell.countLabel.text = stateData?.recovered
    case 3:
      cell.backgroundColor = .systemGray2
      cell.casesLabel.text = "Deaths"
      cell.countLabel.text = stateData?.deaths
    default:
      cell.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    CGSize(width: collectionView.frame.width - 165, height: collectionView.frame.height - 50)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 25
  }
}
