//
//  ContactsVC.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 15/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class ContactsVC: UIViewController {
  
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
  private let contacts = ContactConstants.contacts
  
  override func loadView() {
    super.loadView()
    setupView()
  }
  
  //MARK: - SetupView
  
  private func setupView() {
    self.title = "Helpline Contacts"
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
    collectionView.register(ContactCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.register(ContactHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: contactHeaderId)
    collectionView.register(QuoteHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: quoteHeaderId)
  }
  
}

  //MARK: - Extensions

extension ContactsVC: UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 2
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if section == 0 { return 0 } else { return contacts.count }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ContactCell
    cell.contact = contacts[indexPath.item]
    return cell
  }
  
  //Customising Header
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    if indexPath.section == 0 {
      let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: quoteHeaderId, for: indexPath) as! QuoteHeaderView
      headerView.quoteLabel.text = "Within\nBe Strong"
      headerView.quoteLabel.numberOfLines = 2
      headerView.backgroundColor = .white
      return headerView
    } else {
      let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: contactHeaderId, for: indexPath) as! ContactHeader
      return headerView
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    if section == 0 { return CGSize(width: view.frame.width, height: 140) } else { return CGSize(width: view.frame.width, height: 88) }
  }
}

extension ContactsVC: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: 70)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}

extension ContactsVC: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let height: CGFloat = 140
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
