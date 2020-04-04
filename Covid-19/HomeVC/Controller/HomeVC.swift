//
//  ViewController.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 02/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
  
  private let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 15.0, left: 1.0, bottom: 1.0, right: 1.0)
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    return collectionView
  }()
  
  private let topView = UIView()
  private let cellId = "cellid"
  private let statsHeaderId = "statsheaderid"
  private let tableHeaderId = "tableheaderid"
  private var isAboveTableHeading = true
  private var stateDataArray = [StateData]()
  
  override func loadView() {
    super.loadView()
    setupView()
    CovidClient.fetchTimeSeriesAndStateWiseStats { (stateData) in
      self.stateDataArray = stateData
      self.collectionView.reloadData()
    }
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
    
    let top = collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
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
    collectionView.register(StatsHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: statsHeaderId)
    collectionView.register(TableHeadingView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: tableHeaderId)

    if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout { layout.sectionHeadersPinToVisibleBounds = false }
  }
}

extension HomeVC: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 2
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if section == 0 { return 0 } else { return stateDataArray.count - 1 }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! StateCell
    cell.stateData = stateDataArray[indexPath.row + 1]
    return cell
  }
  
  // Customising Header
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    if indexPath.section == 0 {
      let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: statsHeaderId, for: indexPath) as! StatsHeaderView
      headerView.stateDataArray = stateDataArray
      return headerView
    } else {
      let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: tableHeaderId, for: indexPath) as! TableHeadingView
      return headerView
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    if section == 0 { return CGSize(width: view.frame.width, height: 280) } else { return CGSize(width: view.frame.width, height: 64) }
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

extension HomeVC: UIScrollViewDelegate {

  func scrollViewDidScroll(_ scrollView: UIScrollView) {

    let height: CGFloat = 280
    let y = scrollView.contentOffset.y

    if y > height {
      if isAboveTableHeading {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout { layout.sectionHeadersPinToVisibleBounds = true }
      }
      isAboveTableHeading = false
    } else {
      if isAboveTableHeading == false {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout { layout.sectionHeadersPinToVisibleBounds = false }
      }
      isAboveTableHeading = true
    }

  }

}
