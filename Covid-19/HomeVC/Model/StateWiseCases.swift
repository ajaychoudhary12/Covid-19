//
//  StateWiseCases.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 04/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import Foundation

class StateWiseCases: Codable {
  let stateDataArray: [StateData]
  
  enum CodingKeys: String, CodingKey {
    case stateDataArray = "statewise"
  }
}
