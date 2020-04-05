//
//  CountryChartData.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 05/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import Foundation

struct CountryChartData {
  let confirmedChartData: [String]
  let recoveredChartData: [String]
  let deathsChartData: [String]
  
  init() {
    confirmedChartData = []
    recoveredChartData = []
    deathsChartData = []
  }
  
  init(confirmedChartData: [String], recoveredChartData: [String], deathsChartData: [String]) {
    self.confirmedChartData = confirmedChartData
    self.recoveredChartData = recoveredChartData
    self.deathsChartData = deathsChartData
  }
}
