//
//  StatsHeaderViewCell.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 02/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit
import SwiftChart

class CountryStatsHeaderCell: UICollectionViewCell {
  
  let casesLabel = UILabel()
  let casesCountLabel = UILabel()
  private let chart = Chart(frame: .zero)
  
  var countryDataCard: CountryDataCard? {
    didSet {
      guard let countryDataCard = countryDataCard else { return }
      self.casesLabel.text = countryDataCard.status.rawValue
      self.casesCountLabel.text = countryDataCard.count
      self.populateChart(countryDataCard: countryDataCard)
    }
  }
  
  var chartData: CountryChartData?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView() {
    setupCasesLabel()
    setupCasesCountLabel()
    setupChart()
  }
  
  private func setupCasesLabel() {
    addSubview(casesLabel)
    casesLabel.translatesAutoresizingMaskIntoConstraints = false
      
    let top = casesLabel.topAnchor.constraint(equalTo: topAnchor, constant: 14)
    let leading = casesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14)
    let width = casesLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4)
    let height = casesLabel.heightAnchor.constraint(equalToConstant: 36)
    NSLayoutConstraint.activate([top, leading, width, height])
    
    casesLabel.textColor = .white
    casesLabel.font = .systemFont(ofSize: 24)
  }
    
  private func setupCasesCountLabel() {
    addSubview(casesCountLabel)
    casesCountLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let top = casesCountLabel.topAnchor.constraint(equalTo: casesLabel.bottomAnchor)
    let leading = casesCountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14)
    let width = casesCountLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)
    let height = casesCountLabel.heightAnchor.constraint(equalToConstant: 40)
    NSLayoutConstraint.activate([top, leading, width, height])
      
    casesCountLabel.textColor = .white
    casesCountLabel.font = .systemFont(ofSize: 36)
  }
  
  private func setupChart() {
    addSubview(chart)
    
    chart.translatesAutoresizingMaskIntoConstraints = false
    let top = chart.topAnchor.constraint(equalTo: casesCountLabel.bottomAnchor, constant: 8)
    let height = chart.heightAnchor.constraint(equalToConstant: 110)
    let width = chart.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6)
    let centerX = chart.centerXAnchor.constraint(equalTo: centerXAnchor)
    NSLayoutConstraint.activate([top, height, width, centerX])
    
    chart.backgroundColor = .clear
    chart.showXLabelsAndGrid = false
    chart.showYLabelsAndGrid = false
    chart.isUserInteractionEnabled = false
  }
  
  private func populateChart(countryDataCard: CountryDataCard) {
    guard let stringArray = countryDataCard.chartData else { return }
    chart.removeAllSeries()
    chart.add(makeSeries(array: stringArray))
    chart.reloadInputViews()
  }

  private func makeSeries(array: [String]) -> ChartSeries {
    let series = ChartSeries(array.compactMap(Double.init))
    series.color = .white
    return series
  }
  
}
