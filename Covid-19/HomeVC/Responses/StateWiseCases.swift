//
//  StateWiseCases.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 04/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

struct StateWiseCases: Codable {
  let stateDataArray: [StateData]
  let caseTimeSeries: [CaseTimeSerie]
  
  enum CodingKeys: String, CodingKey {
    case stateDataArray = "statewise"
    case caseTimeSeries = "cases_time_series"
  }
}
