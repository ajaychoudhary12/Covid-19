//
//  StatsHeaderViewCell.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 02/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import UIKit
import SwiftChart

class StatsHeaderCell: UICollectionViewCell {
  
  let casesLabel = UILabel()
  let casesCountLabel = UILabel()
  private let chart = Chart(frame: .zero)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
    
//  Debugging
//    casesLabel.backgroundColor = .white
//    casesCountLabel.backgroundColor = .lightGray
//
//    casesLabel.backgroundColor = .black
//    casesCountLabel.textColor = .black
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
      
    casesLabel.text = "Confirmed"
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
      
    casesCountLabel.text = "2032"
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
    
    let series = self.makeSeries(array: [4, 19, 12, 10, 17, 12, 12, 18, 14, 7, 11, 12, 28])
    self.chart.add(series)
    self.chart.reloadInputViews()
  }

  private func makeSeries(array: [Double]) -> ChartSeries{
    let series = ChartSeries(array)
    series.color = .white
    return series
  }
  
}
