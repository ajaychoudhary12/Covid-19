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
  private let closeSkipButton = UIButton(type: .system)
  private let cellId = "cellid"
  
  private let precautions = [
    Precaution(imageName: "HandWash", description: "Wash Your\nHands Thoroughly", backgroundColor: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)),
    Precaution(imageName: "Mask", description: "Use A Medical\nFace Mask", backgroundColor: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)),
    Precaution(imageName: "Sainitizer", description: "Use Alcohol\nBased Gel", backgroundColor: #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)),
    Precaution(imageName: "Calender", description: "14 - Day\nSelf Qurantine", backgroundColor: #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)),
    Precaution(imageName: "HandShake", description: "Avoid\nPhysical Contact", backgroundColor: #colorLiteral(red: 1, green: 0.5212053061, blue: 1, alpha: 1))
  ]
  
  override func loadView() {
    super.loadView()
    setupView()
  }
  
  private func setupView() {
    view.backgroundColor = .white
    setupCollectionView()
    setupPageControl()
    setupCloseSkipButton()
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
    pageControl.currentPageIndicatorTintColor = .white
    pageControl.pageIndicatorTintColor = UIColor.init(white: 1, alpha: 0.4)
  }
  
  private func setupCloseSkipButton() {
    view.addSubview(closeSkipButton)
    closeSkipButton.translatesAutoresizingMaskIntoConstraints = false
    
    let top = closeSkipButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 2)
    let trailing = closeSkipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
    let height = closeSkipButton.heightAnchor.constraint(equalToConstant: 50)
    let width = closeSkipButton.widthAnchor.constraint(equalToConstant: 60)
    NSLayoutConstraint.activate([top, trailing, height, width])
    
    closeSkipButton.setTitle("Skip", for: .normal)
    closeSkipButton.titleLabel?.font = .systemFont(ofSize: 17)
    closeSkipButton.setTitleColor(.white, for: .normal)
    closeSkipButton.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
  }
  
  //MARK: - Actions
  
  @objc private func closeAction() {
    self.dismiss(animated: true)
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
    if currentPage == 4 {
      closeSkipButton.setTitle("Close", for: .normal)
      collectionView.backgroundColor = #colorLiteral(red: 1, green: 0.5212053061, blue: 1, alpha: 1)
    } else {
      closeSkipButton.setTitle("Skip", for: .normal)
      collectionView.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
    }
  }
  
}
