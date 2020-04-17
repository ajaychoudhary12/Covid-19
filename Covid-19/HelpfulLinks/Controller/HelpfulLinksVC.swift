//
//  HelpfulLinksVC.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 16/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class HelpfulLinksVC: UIViewController {
  
  private let collectionView: UICollectionView = {
      let layout = UICollectionViewFlowLayout()
      layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
      let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
      return collectionView
  }()
    
  private let cellId = "cellid"
  private let contactHeaderId = "contactheaderid"
  private let quoteHeaderId = "quoteheaderid"
  private var isAboveTableHeading = true
  
  private let links = LinkConstants.links
    
  override func loadView() {
    super.loadView()
    setupView()
  }
    
  //MARK: - SetupView
    
  private func setupView() {
    self.title = "Helpful Links"
    view.backgroundColor = .white
    setupCollectionView()
  }
    
  private func setupCollectionView() {
    view.addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
      
    let top = collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
    let leading = collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
    let trailing = collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    let bottom = collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    NSLayoutConstraint.activate([top, leading, trailing, bottom])
      
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.backgroundColor = .white
    collectionView.register(LinkCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.register(QuoteHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: quoteHeaderId)
  }
    
}

    //MARK: - Extensions

extension HelpfulLinksVC: UICollectionViewDataSource {
    
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return links.count
  }
    
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! LinkCell
    cell.link = links[indexPath.item]
    return cell
  }
    
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: view.frame.width, height: 140)
  }
    
  //Customising Header
    
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: quoteHeaderId, for: indexPath) as! QuoteHeaderView
    headerView.quoteLabel.text = "Within\nBe Strong"
    headerView.quoteLabel.numberOfLines = 2
    headerView.backgroundColor = .white
    return headerView
    }
}

extension HelpfulLinksVC: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: 70)
  }
    
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}
