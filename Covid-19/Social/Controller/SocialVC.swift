//
//  Controller.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 07/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class SocialVC: UIViewController {
  
  private let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    return collectionView
  }()
  
  private let cvContainerView = UIView()
  private let twitterButton = UIButton(type: .system)
  private let twitterContainerView = UIView()
  private let toiButton = UIButton(type: .system)
  private let toiContainerView = UIView()
  private let pageControl = UIPageControl()
  
  private var side: CGFloat!
  private let cellId = "cellid"
  private let cvCornerRadius: CGFloat = 20
  private let urls = ["https://twitter.com/MoHFW_INDIA", "https://timesofindia.indiatimes.com/coronavirus/india"]
  
  // Mark: - SetupView
  
  override func loadView() {
    super.loadView()
    setupView()
  }
  
  private func setupView() {
    view.backgroundColor = .systemGroupedBackground
    self.side = (view.frame.width / 5)
    setupTwitterContainerView()
    setupTwitterButton()
    setupToiContainerView()
    setupToiButton()
    setupCvContainerView()
    setupCollectionView()
    setupPageControl()
  }
  
  private func setupTwitterContainerView() {
    view.addSubview(twitterContainerView)
    twitterContainerView.translatesAutoresizingMaskIntoConstraints = false
    
    let top = twitterContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
    let centerX = twitterContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -side)
    let height = twitterContainerView.heightAnchor.constraint(equalToConstant: side - 10)
    let width = twitterContainerView.widthAnchor.constraint(equalToConstant: side - 5)
    NSLayoutConstraint.activate([top, centerX, height, width])
    
    twitterContainerView.layer.cornerRadius = 16
    twitterContainerView.layer.shadowColor = UIColor.lightGray.cgColor
    twitterContainerView.layer.shadowOffset = CGSize(width: 1.5, height: 0.75)
    twitterContainerView.layer.shadowRadius = 12
    twitterContainerView.layer.shadowOpacity = 0.9
  }
  
  private func setupTwitterButton() {
    twitterContainerView.addSubview(twitterButton)
    twitterButton.translatesAutoresizingMaskIntoConstraints = false
    
    let top = twitterButton.topAnchor.constraint(equalTo: twitterContainerView.topAnchor)
    let leading = twitterButton.leadingAnchor.constraint(equalTo: twitterContainerView.leadingAnchor)
    let trailing = twitterButton.trailingAnchor.constraint(equalTo: twitterContainerView.trailingAnchor)
    let bottom = twitterButton.bottomAnchor.constraint(equalTo: twitterContainerView.bottomAnchor)
    NSLayoutConstraint.activate([top, leading, trailing, bottom])
    
    twitterButton.layer.cornerRadius = 16
    twitterButton.clipsToBounds = true
    twitterButton.backgroundColor = .systemGroupedBackground
    twitterButton.setImage(UIImage(named: "twitter")?.withRenderingMode(.alwaysOriginal), for: .normal)
    twitterButton.imageEdgeInsets = UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18)
    
    twitterButton.backgroundColor = #colorLiteral(red: 0.9326940179, green: 0.3850693703, blue: 0.5731982589, alpha: 1)
    twitterContainerView.layer.shadowOpacity = 0
    twitterButton.addTarget(self, action: #selector(twitterAction), for: .touchUpInside)
  }
  
  private func setupToiContainerView() {
    view.addSubview(toiContainerView)
    toiContainerView.translatesAutoresizingMaskIntoConstraints = false
    
    let top = toiContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
    let centerX = toiContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: side)
    let height = toiContainerView.heightAnchor.constraint(equalToConstant: side - 10)
    let width = toiContainerView.widthAnchor.constraint(equalToConstant: side - 5)
    NSLayoutConstraint.activate([top, centerX, height, width])
    
    toiContainerView.layer.cornerRadius = 16
    toiContainerView.layer.shadowColor = UIColor.lightGray.cgColor
    toiContainerView.layer.shadowOffset = CGSize(width: 1.5, height: 0.75)
    toiContainerView.layer.shadowRadius = 12
    toiContainerView.layer.shadowOpacity = 0.9
  }
  
  private func setupToiButton() {
    toiContainerView.addSubview(toiButton)
    toiButton.translatesAutoresizingMaskIntoConstraints = false
    
    let top = toiButton.topAnchor.constraint(equalTo: toiContainerView.topAnchor)
    let leading = toiButton.leadingAnchor.constraint(equalTo: toiContainerView.leadingAnchor)
    let trailing = toiButton.trailingAnchor.constraint(equalTo: toiContainerView.trailingAnchor)
    let bottom = toiButton.bottomAnchor.constraint(equalTo: toiContainerView.bottomAnchor)
    NSLayoutConstraint.activate([top, leading, trailing, bottom])
    
    toiButton.layer.cornerRadius = 16
    toiButton.clipsToBounds = true
    toiButton.backgroundColor = .systemGroupedBackground
    toiButton.setImage(UIImage(named: "instagram")?.withRenderingMode(.alwaysOriginal), for: .normal)
    toiButton.imageEdgeInsets = UIEdgeInsets(top: 18, left: 20, bottom: 18, right: 20)
    toiButton.addTarget(self, action: #selector(toiAction), for: .touchUpInside)
  }
  
  private func setupCvContainerView() {
    view.addSubview(cvContainerView)
    cvContainerView.translatesAutoresizingMaskIntoConstraints = false
    
    let top = cvContainerView.topAnchor.constraint(equalTo: twitterContainerView.bottomAnchor, constant: 22)
    let leading = cvContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
    let trailing = cvContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
    let bottom = cvContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -18)
    NSLayoutConstraint.activate([top, leading, trailing, bottom])
    
    cvContainerView.layer.cornerRadius = cvCornerRadius
    cvContainerView.layer.shadowColor = UIColor.lightGray.cgColor
    cvContainerView.layer.shadowOffset = CGSize(width: 1.5, height: 0.75)
    cvContainerView.layer.shadowRadius = cvCornerRadius
    cvContainerView.layer.shadowOpacity = 0.9
  }
  
  private func setupCollectionView() {
    cvContainerView.addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    let top = collectionView.topAnchor.constraint(equalTo: cvContainerView.topAnchor)
    let leading = collectionView.leadingAnchor.constraint(equalTo: cvContainerView.leadingAnchor)
    let trailing = collectionView.trailingAnchor.constraint(equalTo: cvContainerView.trailingAnchor)
    let bottom = collectionView.bottomAnchor.constraint(equalTo: cvContainerView.bottomAnchor)
    NSLayoutConstraint.activate([top, leading, trailing, bottom])
    
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.isPagingEnabled = true
    collectionView.backgroundColor = .systemGroupedBackground
    
    collectionView.layer.cornerRadius = cvCornerRadius
    collectionView.clipsToBounds = true
    
    collectionView.showsVerticalScrollIndicator = false
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.register(SocialCell.self, forCellWithReuseIdentifier: cellId)
  }
  
  private func setupPageControl() {
    view.addSubview(pageControl)
    pageControl.translatesAutoresizingMaskIntoConstraints = false

    let centerX = pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    let width = pageControl.widthAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.40)
    let height = pageControl.heightAnchor.constraint(equalToConstant: 20)
    let bottom = pageControl.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -10)
    NSLayoutConstraint.activate([centerX, width, height, bottom])

    pageControl.currentPage = 0
    pageControl.numberOfPages = 2
    pageControl.currentPageIndicatorTintColor = .systemPink
    pageControl.pageIndicatorTintColor = .systemGray2
  }
  
  //Mark: - Action
  
  @objc private func twitterAction() {
    collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
    pageControl.currentPage = 0
    twitterButton.backgroundColor = #colorLiteral(red: 0.9326940179, green: 0.3850693703, blue: 0.5731982589, alpha: 1)
    twitterContainerView.layer.shadowOpacity = 0
    
    toiButton.backgroundColor = .systemGroupedBackground
    toiContainerView.layer.shadowOpacity = 0.9
  }
  
  @objc private func toiAction() {
    collectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .centeredHorizontally, animated: true)
    pageControl.currentPage = 1
    toiButton.backgroundColor = #colorLiteral(red: 0.9326940179, green: 0.3850693703, blue: 0.5731982589, alpha: 1)
    toiContainerView.layer.shadowOpacity = 0
    
    twitterButton.backgroundColor = .systemGroupedBackground
    twitterContainerView.layer.shadowOpacity = 0.9
  }
  
}

extension SocialVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 2
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! SocialCell
    cell.urlString = urls[indexPath.item]
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
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
