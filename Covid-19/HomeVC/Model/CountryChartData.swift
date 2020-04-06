//
//  CountryChartData.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 05/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

struct CountryChartData {
  let confirmedChartData: [String]
  let activeChartData: [String]
  let recoveredChartData: [String]
  let deathsChartData: [String]
  
  init() {
    confirmedChartData = []
    activeChartData = []
    recoveredChartData = []
    deathsChartData = []
  }
  
  init(confirmedChartData: [String], activeChartData: [String], recoveredChartData: [String], deathsChartData: [String]) {
    self.confirmedChartData = confirmedChartData
    self.activeChartData = activeChartData
    self.recoveredChartData = recoveredChartData
    self.deathsChartData = deathsChartData
  }
}
