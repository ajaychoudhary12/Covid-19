//
//  DistrictVC.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 06/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class DistrictVC: UIViewController {
  
  var districtData: DistrictWiseData!
  var stateData: StateData!
  private var isAboveTableHeading = true
  
  private let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 15.0, left: 1.0, bottom: 1.0, right: 1.0)
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    return collectionView
  }()
  
  private let cellId = "cellid"
  private let statsHeaderId = "statsheaderid"
  private let tableHeaderId = "tableheaderid"
  
  override func loadView() {
    super.loadView()
    setupView()
  }
  
  //MARK: - SetupView
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: true)
  }
  
  private func setupView() {
    view.backgroundColor = .systemGroupedBackground
    self.title = stateData.state
    setupCollectionView()
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
    
    collectionView.register(PlaceCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.register(StateStatsHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: statsHeaderId)
    collectionView.register(TableHeadingView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: tableHeaderId)

    if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout { layout.sectionHeadersPinToVisibleBounds = false }
  }
}

extension DistrictVC: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 2
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if section == 0 { return 0 } else { return districtData.districts.count }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PlaceCell
    cell.district = districtData.districts[indexPath.item]
    return cell
  }
  
  // Customising Header
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    if indexPath.section == 0 {
      let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: statsHeaderId, for: indexPath) as! StateStatsHeaderView
      headerView.stateData = stateData
      return headerView
    } else {
      let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: tableHeaderId, for: indexPath) as! TableHeadingView
      headerView.stateLabel.text = "DISTRICT"
      return headerView
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    if section == 0 { return CGSize(width: view.frame.width, height: 220) } else { return CGSize(width: view.frame.width, height: 64) }
  }
}

extension DistrictVC: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 16
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = collectionView.frame.width - 40
    return CGSize(width: width, height: 60)
  }
}

extension DistrictVC: UIScrollViewDelegate {

  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let height: CGFloat = 220
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
