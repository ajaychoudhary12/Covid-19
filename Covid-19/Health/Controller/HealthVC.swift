//
//  HealthVC.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 08/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class HealthVC: UIViewController {
  
  private let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 15.0, left: 1.0, bottom: 1.0, right: 1.0)
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    return collectionView
  }()
  
  private let cellId = "cellid"
  private let quoteHeaderId = "quoteheaderid"
  private let tableHeaderId = "tableheaderid"
  private var activityIndicatorContainer: UIView!
  private var activityIndicator: UIActivityIndicatorView!
  private var isAboveTableHeading = true
  
  private var hospitalStates = [HospitalState]()
  
  override func loadView() {
    super.loadView()
    setupView()
    fetchData()
  }
  
  // MARK: - SetupView
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: animated)
  }
  
  private func setupView() {
    view.backgroundColor = .white
    setupCollectionView()
    setupActivityIndicator()
  }
  
  private func setupCollectionView() {
    view.addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    let top = collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
    let leading = collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
    let trailing = collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
    let bottom = collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    NSLayoutConstraint.activate([top, leading, trailing, bottom])
    
    collectionView.dataSource = self
    collectionView.delegate = self
    
    collectionView.backgroundColor = .white
    collectionView.bounces = false
    collectionView.alwaysBounceVertical = false
    
    collectionView.register(HealthStateCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.register(QuoteHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: quoteHeaderId)
    collectionView.register(HealthTableHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: tableHeaderId)
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
  
  private func loadingData(_ loadingData: Bool) {
    if loadingData {
      activityIndicator.startAnimating()
      collectionView.isScrollEnabled = false
      collectionView.isUserInteractionEnabled = false
    } else {
      activityIndicator.stopAnimating()
      activityIndicatorContainer.removeFromSuperview()
      collectionView.isScrollEnabled = true
      collectionView.isUserInteractionEnabled = true
    }
  }
  
  //MARK: - NetworkCalls
  
  private func fetchData() {
    loadingData(true)
    CovidClient.fetchHospitalData(completion: handleHospitalData)
  }
  
  private func handleHospitalData(medicalColleges: [MedicalCollege], error: ErrorMessage?) {
    if error != nil {
      DispatchQueue.main.async { self.loadingData(false) }
      presentCustomAlertOnMainThread(title: "Bad stuff Happened", message: error!.rawValue, delegate: self)
      return
    }
    
    self.hospitalStates = populateHospitalStates(medicalColleges: medicalColleges)
    DispatchQueue.main.async {
      self.collectionView.reloadData()
      self.loadingData(false)
    }
  }
  
  //MARK: - Logic
  
  private func populateHospitalStates(medicalColleges: [MedicalCollege]) -> [HospitalState] {
    let stateNames = getStateNames(medicalColleges: medicalColleges)
    
    var hospitalStates = [HospitalState]()
    for state in stateNames {
      var hospitals = [String]()
      for medicalCollege in medicalColleges {
        if state == medicalCollege.state { hospitals.append(medicalCollege.name) }
      }
      let hospitalState = HospitalState(name: state, hospitals: hospitals)
      hospitalStates.append(hospitalState)
    }
    
    return hospitalStates
  }
  
  private func getStateNames(medicalColleges: [MedicalCollege]) -> [String] {
    var stateNames = [String]()
    
    for medicalCollege in medicalColleges {
      if !stateNames.contains(medicalCollege.state) {
        stateNames.append(medicalCollege.state)
      }
    }
    return stateNames
  }
  
}

//MARK: - Extensions

extension HealthVC: UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 2
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if section == 0 { return 0 } else { return hospitalStates.count }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HealthStateCell
    cell.hospitalState = hospitalStates[indexPath.item]
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let hospitalState = hospitalStates[indexPath.item]
    let helplineCenterVC = HelplineCentersVC()
    helplineCenterVC.hospitalState = hospitalState
    present(helplineCenterVC, animated: true)
  }
  
  // Customising Header
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    if indexPath.section == 0 {
      let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: quoteHeaderId, for: indexPath) as! QuoteHeaderView
      headerView.quoteLabel.text = "Your Wellbeing is\n  Our #1 Priority"
      headerView.quoteLabel.numberOfLines = 2
      return headerView
    } else {
      let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: tableHeaderId, for: indexPath) as! HealthTableHeaderView
      return headerView
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    if section == 0 { return CGSize(width: view.frame.width, height: 140) } else { return CGSize(width: view.frame.width, height: 64) }
  }
}

extension HealthVC: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 16
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = collectionView.frame.width - 40
    return CGSize(width: width, height: 60)
  }
}

extension HealthVC: UIScrollViewDelegate {
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

extension HealthVC: RefreshHomeDelegate {
  func refresh() {
    setupActivityIndicator()
    activityIndicator.startAnimating()
    fetchData()
  }
}
