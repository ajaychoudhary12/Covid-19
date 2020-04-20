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
  
  private let headingLabel = UILabel()
  private let cornerRadius: CGFloat = 20
  private let cellId = "cellid"
  private let questions = QuestionConstants.questions

  private var position = 0
  private var userAnswers = [String]()
  
  //MARK: - SetupView
  
  override func loadView() {
    super.loadView()
    setupView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    userAnswers = []
    position = 0
    collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
    collectionView.reloadData()
  }
  
  private func setupView() {
    view.backgroundColor = .white
    setupCollectionView()
    setupHeadingLabel()
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
    collectionView.backgroundColor = .white
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.isScrollEnabled = false
    collectionView.register(QuestionCard.self, forCellWithReuseIdentifier: cellId)
  }
  
  private func setupHeadingLabel() {
    view.addSubview(headingLabel)
    headingLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let top = headingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
    let leading = headingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
    let trailing = headingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    let height = headingLabel.heightAnchor.constraint(equalToConstant: 56)
    NSLayoutConstraint.activate([top, leading, trailing, height])
    
    headingLabel.text = "Symptom Checker"
    headingLabel.textColor = .systemPink
    headingLabel.backgroundColor = .clear
    headingLabel.font = .boldSystemFont(ofSize: 32)
  }
  
  //MARK: - Logic
  
  private func checkSymptom(userAnswers: [String]) -> String {
    if !(userAnswers[4].lowercased() == "none of the above") || userAnswers[5].lowercased() == "yes" || userAnswers[6].lowercased() == "yes" {
      return "High Risk"
    } else if userAnswers[7].lowercased() == "yes" && userAnswers[12].lowercased() == "yes" {
      return "Medium Risk"
    } else { return "Low Risk" }
  }
}

  //MARK: - Extensions

extension SymptomCheckerVC: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return questions.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! QuestionCard
    cell.question = questions[indexPath.item]
    cell.delegate = self
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

extension SymptomCheckerVC: DidSelectItemDelegate {
  func didSelectItem(answer: String) {
    userAnswers.append(answer)
    position += 1
    if position <= 13 {
      let indexPath = IndexPath(item: position, section: 0)
      collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    } else {
      print(userAnswers)
      let testVC = TestVC()
      testVC.result = checkSymptom(userAnswers: userAnswers)
      present(testVC, animated: true, completion: {
        self.userAnswers = []
        self.position = 0
        self.collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
      })
    }
  }
}
class TestVC: UIViewController {
  
  var result = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .black
    print(result)
  }
}
