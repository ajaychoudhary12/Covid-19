//
//  QuestionCell.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 11/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

protocol DidSelectItemDelegate {
  func didSelectItem(answer: String)
}

class QuestionCard: UICollectionViewCell {
  
  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 6.0, left: 1.0, bottom: 8.0, right: 1.0)
    layout.sectionHeadersPinToVisibleBounds = true
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    return collectionView
  }()
  
  private let containerView = UIView()
  private let cornerRadius: CGFloat = 20
  private let cellId = "cellid"
  private let headerId = "headerid"
  private var heightConstraint: NSLayoutConstraint!
  var delegate: DidSelectItemDelegate?
  
  var question: Question? {
    didSet {
      guard let question = question else { return }
      let paddingTotal = CGFloat(question.answers.count - 2) * 8
      let answerCellHeightTotal = CGFloat(question.answers.count) * 40
      let edgeInset: CGFloat = 24
      
      let approximateWidthOfQuestionHeader = frame.width - 20
      let size = CGSize(width: approximateWidthOfQuestionHeader, height: 1000)
      let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]
      let estimatedFrame = NSString(string: question.question).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
      let heightOfHeader = estimatedFrame.height + 40
      let heightConstant = frame.height - (paddingTotal + answerCellHeightTotal + edgeInset + heightOfHeader)
      heightConstraint.constant = -heightConstant
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
    backgroundColor = .white
    setupContainerView()
    setupCollectionView()
  }
  
  private func setupContainerView() {
    addSubview(containerView)
    containerView.translatesAutoresizingMaskIntoConstraints = false
    
    let centerY = containerView.centerYAnchor.constraint(equalTo: centerYAnchor)
    let leading = containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
    let trailing = containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
    heightConstraint = containerView.heightAnchor.constraint(equalTo: heightAnchor)
    heightConstraint.isActive = true
    
    NSLayoutConstraint.activate([centerY, leading, trailing])
    
    containerView.layer.cornerRadius = cornerRadius
    containerView.layer.shadowColor = UIColor.lightGray.cgColor
    containerView.layer.shadowOffset = CGSize(width: 1.5, height: 0.5)
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
    collectionView.backgroundColor = .white
    
    collectionView.layer.cornerRadius = cornerRadius
    collectionView.clipsToBounds = true
    
    collectionView.showsVerticalScrollIndicator = false
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.register(AnswerCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.register(QuestionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
  }
}

extension QuestionCard: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if let question = question { return question.answers.count } else { return 0 }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AnswerCell
    cell.answer = question?.answers[indexPath.item]
    cell.backgroundColor = .white
    cell.answerLabel.textColor = .systemPink
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let cell = collectionView.cellForItem(at: indexPath) as! AnswerCell
    cell.backgroundColor = .systemPink
    cell.answerLabel.textColor = .white
    let answer = question?.answers[indexPath.item]
    delegate?.didSelectItem(answer: answer ?? "")
  }
  
  //Customising Header
   
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId, for: indexPath) as! QuestionHeader
    headerView.question = question?.question
    return headerView
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    guard let question = question else { return CGSize(width: 0, height: 0) }
    let approximateWidthOfQuestionHeader = frame.width - 20
    let size = CGSize(width: approximateWidthOfQuestionHeader, height: 1000)
    let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]
    let estimatedFrame = NSString(string: question.question).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)

    return CGSize(width: collectionView.frame.width, height: estimatedFrame.height + 40)
  }
  
}

extension QuestionCard: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 8
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = collectionView.frame.width - 40
    return CGSize(width: width, height: 40)
  }
}
