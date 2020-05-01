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
  private let pageControl = UIPageControl()
  private let nextButton = UIButton(type: .system)
  private let prevButton = UIButton(type: .system)
  
  private var side: CGFloat!
  private let cellId = "cellid"
  private let cvCornerRadius: CGFloat = 20
  private let urls = ["https://twitter.com/MoHFW_INDIA", "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/events-as-they-happen"]
  
  private var activityIndicatorContainer: UIView!
  private var activityIndicator: UIActivityIndicatorView!
  
  // Mark: - SetupView
  
  override func loadView() {
    super.loadView()
    setupView()
  }
  
  private func setupView() {
    view.backgroundColor = .white
    self.side = (view.frame.width / 5)
    setupCvContainerView()
    setupCollectionView()
    setupPageControl()
    setupPrevButton()
    setupNextButton()
    setupActivityIndicator()
  }
  
  private func setupCvContainerView() {
    view.addSubview(cvContainerView)
    cvContainerView.translatesAutoresizingMaskIntoConstraints = false
    
    let top = cvContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12)
    let leading = cvContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
    let trailing = cvContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
    let bottom = cvContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24)
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
    collectionView.backgroundColor = .white
    
    collectionView.layer.cornerRadius = cvCornerRadius
    collectionView.clipsToBounds = true
    
    collectionView.showsVerticalScrollIndicator = false
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.register(SocialCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.isScrollEnabled = false
  }
  
  private func setupPageControl() {
    view.addSubview(pageControl)
    pageControl.translatesAutoresizingMaskIntoConstraints = false

    let centerX = pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    let width = pageControl.widthAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.20)
    let height = pageControl.heightAnchor.constraint(equalToConstant: 20)
    let bottom = pageControl.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -10)
    NSLayoutConstraint.activate([centerX, width, height, bottom])

    pageControl.currentPage = 0
    pageControl.numberOfPages = 2
    pageControl.currentPageIndicatorTintColor = .systemPink
    pageControl.pageIndicatorTintColor = .systemGray2
  }
  
  private func setupPrevButton() {
    view.addSubview(prevButton)
    prevButton.translatesAutoresizingMaskIntoConstraints = false
    
    let leading = prevButton.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor, constant: 10)
    let height = prevButton.heightAnchor.constraint(equalToConstant: 40)
    let width = prevButton.widthAnchor.constraint(equalToConstant: 40)
    let bottom = prevButton.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor)
    NSLayoutConstraint.activate([leading, height, width, bottom])
    
    prevButton.setImage(UIImage(named: "back")?.withRenderingMode(.alwaysOriginal), for: .normal)
    prevButton.addTarget(self, action: #selector(prevAction), for: .touchUpInside)
    prevButton.imageEdgeInsets = UIEdgeInsets(top: 7.5, left: 5, bottom: 7.5, right: 5)
  }
  
  private func setupNextButton() {
    view.addSubview(nextButton)
    nextButton.translatesAutoresizingMaskIntoConstraints = false
    
    let trailing = nextButton.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: -10)
    let height = nextButton.heightAnchor.constraint(equalToConstant: 40)
    let width = nextButton.widthAnchor.constraint(equalToConstant: 40)
    let bottom = nextButton.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor)
    NSLayoutConstraint.activate([trailing, height, width, bottom])
    
    nextButton.setImage(UIImage(named: "next")?.withRenderingMode(.alwaysOriginal), for: .normal)
    nextButton.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
    nextButton.imageEdgeInsets = UIEdgeInsets(top: 7.5, left: 5, bottom: 7.5, right: 5)
  }
  
  private func setupActivityIndicator() {
    activityIndicatorContainer = ActivityIndicatorContainer(view: view)
    
    activityIndicator = UIActivityIndicatorView()
    activityIndicator.hidesWhenStopped = true
    activityIndicator.style = UIActivityIndicatorView.Style.large
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    activityIndicatorContainer.addSubview(activityIndicator)
    view.addSubview(activityIndicatorContainer)
    
    activityIndicator.centerXAnchor.constraint(equalTo: activityIndicatorContainer.centerXAnchor).isActive = true
    activityIndicator.centerYAnchor.constraint(equalTo: activityIndicatorContainer.centerYAnchor).isActive = true
  }
  
  //MARK: - Actions
  
  @objc private func prevAction() {
    collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
    pageControl.currentPage = 0
  }
  
  @objc private func nextAction() {
    collectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .centeredHorizontally, animated: true)
    pageControl.currentPage = 1
  }
  
}

  //MARK: - Extensions
  
extension SocialVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 2
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! SocialCell
    cell.delegate = self
    activityIndicator.startAnimating()
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

extension SocialVC: WebViewDelegate {
  func didFail() {
    activityIndicator.stopAnimating()
    activityIndicatorContainer.removeFromSuperview()
  }
  
  func didFinish() {
    activityIndicator.stopAnimating()
    activityIndicatorContainer.removeFromSuperview()
  }
}
