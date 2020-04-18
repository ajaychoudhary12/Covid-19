//
//  IntroVC.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 17/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class IntroVC: UIViewController {
  
  private let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    return collectionView
  }()
  
  private let pageControl = UIPageControl()
  private let cellId = "cellid"
  private let precautions = [
    Precaution(imageName: "", description: "Wash Your\nHands Thoroughly", backgroundColor: .white),
    Precaution(imageName: "", description: "Use A Medical\nFace Mask", backgroundColor: .white),
    Precaution(imageName: "", description: "Use Alcohol\nBased Gel", backgroundColor: .white),
    Precaution(imageName: "", description: "14 - Day\nSelf Qurantine", backgroundColor: .white),
    Precaution(imageName: "", description: "Avoid\nPhysical Contact", backgroundColor: .white)
  ]
  
  override func loadView() {
    super.loadView()
    setupView()
  }
  
  private func setupView() {
    view.backgroundColor = .white
    setupCollectionView()
    setupPageControl()
  }
  
  private func setupCollectionView() {
    view.addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    let top = collectionView.topAnchor.constraint(equalTo: view.topAnchor)
    let leading = collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
    let trailing = collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    let bottom = collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    NSLayoutConstraint.activate([top, leading, trailing, bottom])
    
    collectionView.backgroundColor = .white
    collectionView.showsVerticalScrollIndicator = false
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.isPagingEnabled = true
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(IntroCell.self, forCellWithReuseIdentifier: cellId)
  }
  
  private func setupPageControl() {
    view.addSubview(pageControl)
    pageControl.translatesAutoresizingMaskIntoConstraints = false

    let centerX = pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    let width = pageControl.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.40)
    let height = pageControl.heightAnchor.constraint(equalToConstant: 40)
    let bottom = pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
    NSLayoutConstraint.activate([centerX, width, height, bottom])

    pageControl.currentPage = 0
    pageControl.numberOfPages = 5
    pageControl.currentPageIndicatorTintColor = .darkGray
    pageControl.pageIndicatorTintColor = .lightGray
  }
  
}

  //MARK: - Extensions

extension IntroVC: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return precautions.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! IntroCell
    cell.precaution = precautions[indexPath.item]
    return cell
  }
}

extension IntroVC: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
  }
  
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let x = targetContentOffset.pointee.x
    let currentPage = Int(x / collectionView.frame.width)
    pageControl.currentPage = currentPage
  }
  
}
