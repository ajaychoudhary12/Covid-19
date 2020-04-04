//
//  StatsHeaderView.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 02/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class StatsHeaderView: UICollectionReusableView {
  
  private let collectionView: UICollectionView = {
      let layout = UICollectionViewFlowLayout()
      layout.scrollDirection = .horizontal
      let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
      return collectionView
  }()
  
  private let containerView = UIView()
  private let cornerRadius: CGFloat = 20
  private let pageControl = UIPageControl()
  private let cellId = "cellid"
  private var countryDataArray = [CountryDataCard]()
  
  var stateDataArray: [StateData]? {
    didSet {
      guard let stateDataArray = stateDataArray else { return }
      guard stateDataArray.count != 0 else { return }
      self.countryDataArray = makeCountryData(state: stateDataArray[0])
      collectionView.reloadData()
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
    backgroundColor = .systemGroupedBackground
    setupContainerView()
    setupCollectionView()
    setupPageControl()
  }
  
  private func setupContainerView() {
    addSubview(containerView)
    containerView.translatesAutoresizingMaskIntoConstraints = false
    
    let top = containerView.topAnchor.constraint(equalTo: topAnchor, constant: 14)
    let leading = containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
    let trailing = containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
    let bottom = containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14)
    NSLayoutConstraint.activate([top, leading, trailing, bottom])
    
    containerView.layer.cornerRadius = cornerRadius
    containerView.layer.shadowColor = UIColor.darkGray.cgColor
    containerView.layer.shadowOffset = CGSize(width: 5, height: 2.5)
    containerView.layer.shadowRadius = cornerRadius
    containerView.layer.shadowOpacity = 0.9
  }
    
  private func setupCollectionView() {
    containerView.addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
      
    let top = collectionView.topAnchor.constraint(equalTo: containerView.topAnchor)
    let leading = collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor)
    let trailing = collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
    let bottom = collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
    NSLayoutConstraint.activate([top, leading, trailing, bottom])
    
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.isPagingEnabled = true
    
    collectionView.layer.cornerRadius = cornerRadius
    collectionView.clipsToBounds = true
    
    collectionView.showsVerticalScrollIndicator = false
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.register(StatsHeaderCell.self, forCellWithReuseIdentifier: cellId)
  }
  
  private func setupPageControl() {
    addSubview(pageControl)
    pageControl.translatesAutoresizingMaskIntoConstraints = false

    let centerX = pageControl.centerXAnchor.constraint(equalTo: centerXAnchor)
    let width = pageControl.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.40)
    let height = pageControl.heightAnchor.constraint(equalToConstant: 40)
    let bottom = pageControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
    NSLayoutConstraint.activate([centerX, width, height, bottom])

    pageControl.currentPage = 0
    pageControl.numberOfPages = 4
    pageControl.currentPageIndicatorTintColor = .darkGray
    pageControl.pageIndicatorTintColor = .white
  }
  
  private func makeCountryData(state: StateData) -> [CountryDataCard]{
    return [
      CountryDataCard(status: "Confirmed", count: state.confirmed),
      CountryDataCard(status: "Active", count: state.active),
      CountryDataCard(status: "Recovered", count: state.recovered),
      CountryDataCard(status: "Death", count: state.deaths)
    ]
  }
}

extension StatsHeaderView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return countryDataArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! StatsHeaderCell
    cell.countryDataCard = self.countryDataArray[indexPath.row]
    switch indexPath.row {
    case 0:
      cell.backgroundColor = .systemPink
      collectionView.backgroundColor = .systemPink
    case 1:
      cell.backgroundColor = .systemBlue
    case 2:
      cell.backgroundColor = .systemGreen
    case 3:
      cell.backgroundColor = .systemGray2
      collectionView.backgroundColor = .systemGray2
    default:
      cell.backgroundColor = .systemPink
    }
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let x = targetContentOffset.pointee.x
    let currentPage = Int(x / collectionView.frame.width)
    pageControl.currentPage = currentPage
  }
}
