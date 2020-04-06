//
//  CaseTimeSeries.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 05/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import Foundation

struct CaseTimeSerie: Codable {
  let totalConfirmed: String
  let totalDeaths: String
  let totalRecovered: String
  
  enum CodingKeys: String, CodingKey {
    case totalConfirmed = "totalconfirmed"
    case totalDeaths = "totaldeceased"
    case totalRecovered = "totalrecovered"
  }
}
