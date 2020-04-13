//
//  SymptomCheckerVC.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 11/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class SymptomCheckerVC: UIViewController {
  
  private let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    return collectionView
  }()
  
  private let cornerRadius: CGFloat = 20
  private let pageControl = UIPageControl()
  private let cellId = "cellid"
  private let questions = QuestionConstants.questions
  
  override func loadView() {
    super.loadView()
    setupView()
  }
  
  private func setupView() {
    view.backgroundColor = .systemGroupedBackground
    setupCollectionView()
  }
  
  private func setupCollectionView() {
    view.addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    let centerY = collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    let leading = collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
    let trailing = collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    let height = collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.78)
    NSLayoutConstraint.activate([centerY, leading, trailing, height])
    
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.isPagingEnabled = true
    collectionView.backgroundColor = .systemGroupedBackground
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.isScrollEnabled = false
    collectionView.register(QuestionCard.self, forCellWithReuseIdentifier: cellId)
  }
  
}

extension SymptomCheckerVC: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return questions.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! QuestionCard
    cell.question = questions[indexPath.item]
    return cell
  }
}

extension SymptomCheckerVC: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}
