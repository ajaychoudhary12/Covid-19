//
//  ViewController.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 02/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
  
  private let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 15.0, left: 1.0, bottom: 1.0, right: 1.0)
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    return collectionView
  }()
  
  private var activityIndicatorContainer: UIView!
  private var activityIndicator: UIActivityIndicatorView!
  
  private let cellId = "cellid"
  private let statsHeaderId = "statsheaderid"
  private let tableHeaderId = "tableheaderid"
  private var isAboveTableHeading = true
  private var stateDataArray = [StateData]()
  private var countryDataCardState = CountryDataCardState.confirmed
  
  private var countryChartData = CountryChartData()
  
  // District Properties
  private var districtWiseDataArray = [DistrictWiseData]()
  
  private var caseTimeSeries = [CaseTimeSerie]() {
    didSet {
      var confirmedChartData = [String]()
      var activeChartData = [String]()
      var recoveredChartData = [String]()
      var deathsChartData = [String]()
      
      for caseTimeSerie in caseTimeSeries {
        
        let confirmed = Int(caseTimeSerie.totalConfirmed) ?? 0
        let recovered = Int(caseTimeSerie.totalRecovered) ?? 0
        let deaths = Int(caseTimeSerie.totalDeaths) ?? 0
        let active = String(confirmed - (recovered + deaths))
        
        confirmedChartData.append(caseTimeSerie.totalConfirmed)
        recoveredChartData.append(caseTimeSerie.totalRecovered)
        deathsChartData.append(caseTimeSerie.totalDeaths)
        activeChartData.append(active)
      }
      self.countryChartData = CountryChartData(confirmedChartData: confirmedChartData,
                                               activeChartData: activeChartData,
                                               recoveredChartData: recoveredChartData,
                                               deathsChartData: deathsChartData)
    }
  }
  
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
    view.backgroundColor = .systemGroupedBackground
    setupCollectionView()
    setupActivityIndicator()
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
    
    collectionView.backgroundColor = .systemGroupedBackground
    collectionView.bounces = false
    collectionView.alwaysBounceVertical = false
    
    collectionView.register(PlaceCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.register(CountryStatsHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: statsHeaderId)
    collectionView.register(TableHeadingView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: tableHeaderId)

    if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout { layout.sectionHeadersPinToVisibleBounds = false }
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
  
  // MARK: - NetworkCalls
  
  private func fetchData() {
    loadingData(true)
    CovidClient.fetchTimeSeriesAndStateWiseStats(completion: handleStateData)
    CovidClient.fetchDistrictData(completion: handleDistrictData)
  }
  
  private func handleStateData(stateData: [StateData], caseTimeSeries: [CaseTimeSerie], error: ErrorMessage?) {
    if error != nil {
      DispatchQueue.main.async { self.loadingData(false) }
      self.presentCustomAlertOnMainThread(title: "Bad stuff Happened", message: error!.rawValue, delegate: self)
      return
    }
    self.stateDataArray = stateData
    self.caseTimeSeries = caseTimeSeries
    DispatchQueue.main.async {
      self.collectionView.reloadData()
      self.loadingData(false)
    }
  }
  
  private func handleDistrictData(districtWiseData: [DistrictWiseData], error: ErrorMessage?) {
    self.districtWiseDataArray = districtWiseData
  }
  
}

  //MARK: Extensions

extension HomeVC: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 2
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if section == 0 { return 0 } else { return stateDataArray.count - 1 }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PlaceCell
    cell.stateData = stateDataArray[indexPath.item + 1]
    cell.countryDataCardState = self.countryDataCardState
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let state = stateDataArray[indexPath.item + 1].state
    for data in districtWiseDataArray {
      if state == data.state {
        let districtVC = DistrictVC()
        districtVC.districtData = data
        districtVC.stateData = stateDataArray[indexPath.item + 1]
        self.parent?.navigationController?.pushViewController(districtVC, animated: true)
      }
    }
  }
  
  // Customising Header
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    if indexPath.section == 0 {
      let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: statsHeaderId, for: indexPath) as! CountryStatsHeaderView
      headerView.countryChartData = countryChartData
      headerView.stateDataArray = stateDataArray
      headerView.delegate = self
      return headerView
    } else {
      let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: tableHeaderId, for: indexPath) as! TableHeadingView
      headerView.countryDataCardState = self.countryDataCardState
      return headerView
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    if section == 0 { return CGSize(width: view.frame.width, height: 280) } else { return CGSize(width: view.frame.width, height: 64) }
  }
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 16
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = collectionView.frame.width - 40
    return CGSize(width: width, height: 60)
  }
}

extension HomeVC: UIScrollViewDelegate {

  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let height: CGFloat = 280
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

extension HomeVC: ChangeCountFieldDelegate {
  func changeCountFieldData(countryDataCardState: CountryDataCardState) {
    self.countryDataCardState = countryDataCardState
    collectionView.reloadData()
  }
}

extension HomeVC: RefreshHomeDelegate {
  func refresh() {
    setupActivityIndicator()
    activityIndicator.startAnimating()
    fetchData()
  }
}
